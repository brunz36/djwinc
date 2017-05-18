class Item < ApplicationRecord
  has_many :photos

  # def self.categories
  #   %W{Rings Earrings Bracelets Necklaces Other}
  # end
end
