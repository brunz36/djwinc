class PhotosController < ApplicationController
  before_action :authorize

  # POST /photos
  def create
    @item  = Item.find(params[:item_id])
    @photo = @item.photos.new(photo_params)

    if @photo.save
      redirect_to edit_admin_item_path(@item), notice: 'Photo was successfully created.'
    else
      redirect_to edit_admin_item_path(@item), notice: 'Could not save photo.'
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @photo = @item.photos.find(params[:id])
    @photo.destroy
    redirect_to edit_admin_item_path(@item), notice: 'Photo was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:image)
  end
end
