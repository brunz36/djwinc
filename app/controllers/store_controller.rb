class StoreController < ApplicationController
  def index
    @items = Item.where(in_stock: true).order(created_at: :asc).page params[:page]
  end
end
