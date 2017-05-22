class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    @items = Item.all
  end

  def item
    @item = Item.find(params[:id])
  end
end
