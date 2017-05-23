class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.item.price
    end
    sum
  end
end
