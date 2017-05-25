class StoreController < ApplicationController
  def index
    @items = Item.all.page params[:page]
  end
end
