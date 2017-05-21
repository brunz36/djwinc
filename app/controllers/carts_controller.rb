class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
    @cart = Cart.find(params[:id])
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    # @cart.destroy if @cart.id == session[:cart_id]
    # session[:cart_id] = nil
    # redirect_to item_url, notice: 'Your cart is empty.'
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to items_path, notice: 'Your cart is now empty.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to item_url, notice: 'Invalid cart'
  end
end
