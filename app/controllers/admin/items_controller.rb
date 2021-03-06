module Admin
  class ItemsController < ApplicationController
    before_action :authorize

    # GET /items
    def index
      @items = Item.order(:created_at).page( params[:page]).per(10)
    end

    # GET /items/1
    def show
      @item = Item.find(params[:id])
    end

    # GET /items/new
    def new
      @item = Item.new
    end

    # GET /items/1/edit
    def edit
      @item = Item.find(params[:id])
    end

    # POST /items
    def create
      @item = Item.new(item_params)

      if @item.save
        redirect_to admin_item_path(@item), notice: 'Item was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /items/1
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admin_item_path(@item), notice: 'Item was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /items/1
    def destroy
      @item = Item.find(params[:id])

      if @item.destroy
        redirect_to admin_items_path, notice: 'Item was successfully destroyed.'
      else
        redirect_to admin_items_path, notice: 'Item was not destroyed.'
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:category, :metal, :center_stone, :certification, :stones, :size, :appraisal, :price, :description, :name, :in_stock)
    end
  end
end
