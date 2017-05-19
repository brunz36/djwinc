class Photo < ApplicationRecord
  belongs_to :item

  validates :image_data, presence: true

  include ImageUploader[:image]
end
