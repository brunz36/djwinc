class PhotosController < ApplicationController
  # POST /photos
  def create
    @item  = Item.find(params[:item_id])
    @photo = @item.photos.new(photo_params)

    if @photo.save
      redirect_to @photo.item, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:image)
  end
end
