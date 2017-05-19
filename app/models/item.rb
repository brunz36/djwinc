class Item < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates :price, length: { in: 3...6 }, numericality: true
  validates :description, length: { in: 5..255 }


  def self.categories
    %W{Rings Earrings Bracelets Necklaces Other}
  end

  def self.metals
    %W{18KY 18KW 18KR PL 14KY 14KW Two-Tone Other}
  end
end
