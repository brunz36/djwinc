class LineItemsController < ApplicationController

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # POST /line_items
  def create
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart

    if current_cart.items.include?(chosen_item)
      redirect_to current_cart, notice: 'You already had this item in your cart.'
      return
    end

    @line_item = LineItem.new
    @line_item.cart = current_cart
    @line_item.item = chosen_item

    if @line_item.save
      redirect_to cart_path(current_cart)
    else
      render :new
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path, notice: 'Your Item was Removed from the Cart.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def line_item_params
    params.require(:line_item).permit(:item_id, :cart_id)
  end
end
