class Item < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, length: { in: 2...10 }, numericality: true
  validates :description, length: { in: 5..255 }
  validates :name, :category, :metal, presence: true

  monetize :price_cents

  ransacker :price_money, type: :integer, formatter: proc { |dollars| dollars * 100 } do |p|
    p.table[:price_cents]
  end

  include FileUploader[:appraisal]
  include FileUploader[:certification]

  def self.categories
    %W{Rings Earrings Bracelets Necklaces Other}
  end

  def self.metals
    %W{18KY 18KW 18KR PL 14KY 14KW Two-Tone Other}
  end

  def self.in_stock
    %W{true false}
  end

  def thumbnail_photo
    photos.first
  end

private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
