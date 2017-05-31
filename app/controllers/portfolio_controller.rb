class PortfolioController < ApplicationController
  def index
    @items = Item.where(in_stock: false).order(created_at: :asc).page params[:page]
  end
end
