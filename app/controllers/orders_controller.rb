class OrdersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  # GET /orders
  def index
    @orders = Order.all.order(created_at: :asc).page(params[:page]).per(10)
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderMailer.received(@order).deliver_later
      # @order.move_items_to_portfolio
      redirect_to store_index_path
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      if @order.tracking_number_previously_changed?
        OrderMailer.shipped(@order).deliver_later
      end
      redirect_to orders_path, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :city, :state, :zip, :phone_number, :email, :pay_type, :tracking_number)
  end
end
