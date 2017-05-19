require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
  plugin :validation_helpers

  process(:store) do |io, context|
    original = io.download

    original = convert(original, "png")

    size_800 = resize_and_pad!(original, 800, 600)
    size_500 = resize_and_pad(size_800,  500, 375)
    size_250 = resize_and_pad(size_500,  250, 188)
    size_50  = resize_and_pad(size_250,  50, 38)

    { large: size_800, medium: size_500, small: size_250, thumbnail: size_50 }
  end

  Attacher.validate do
    validate_extension_inclusion %w[jpg jpeg png]
    validate_max_size 3.megabytes
  end
end
