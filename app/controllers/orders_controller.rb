class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new

  # GET /orders
  def index
    @orders = Order.all
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
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderMailer.received(@order).deliver_later
      redirect_to items_path, notice: 'Thank you for the Order'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
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
    params.require(:order).permit(:first_name, :last_name, :address, :city, :state, :zip, :phone_number, :email, :pay_type)
  end

  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to item_index_url, notice: 'Your cart is empty.'
    end
  end
end
