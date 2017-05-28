class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    if Search.count > 500
      Search.delete_all()
    end
    @search = Search.create(search_params)
    if @search.max_price.nil?
      @search.max_price = 0
    end
    if @search.min_price.nil?
      @search.min_price = 0
    end
    @search.max_price *= 100
    @search.min_price *= 100
    @search.save
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :category, :min_price, :max_price)
  end
end
