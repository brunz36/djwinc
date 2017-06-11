class StoreController < ApplicationController
  def index
    @q = Item.where(in_stock: true).ransack(params[:q])
    @items = @q.result(distinct: true).order(created_at: :asc).page params[:page]
  end
end

# @items = Item.where(in_stock: true).order(created_at: :asc).page params[:page]

# @q = Person.ransack(params[:q])
# @people = @q.result(distinct: true)
