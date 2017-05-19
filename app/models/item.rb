class Item < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, length: { in: 3...6 }, numericality: true
  validates :description, length: { in: 5..255 }

  def self.categories
    %W{Rings Earrings Bracelets Necklaces Other}
  end

  def self.metals
    %W{18KY 18KW 18KR PL 14KY 14KW Two-Tone Other}
  end

private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
