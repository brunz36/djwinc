class Photo < ApplicationRecord
  belongs_to :item

  include ImageUploader[:image]
end
