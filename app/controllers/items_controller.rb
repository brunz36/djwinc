class ItemsController < ApplicationController
  # GET /items/1
  def show
    @item = Item.find(params[:id])
  end
end
