class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  skip_before_action :authorize, only: :create

  # GET /line_items
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  def show
    @line_item = LineItem.find(params[:id])
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  def create
    item = Item.find(params[:item_id])

    if @cart.items.include?(item)
      # already have it...
      redirect_to item, notice: 'Line item was already in the cart'
      return
    end

    @line_item = @cart.line_items.build(item: item)

    if @line_item.save
      redirect_to @line_item.cart
    else
      render :new
    end
  end

  # PATCH/PUT /line_items/1
  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def line_item_params
    params.require(:line_item).permit(:item_id)
  end
end
