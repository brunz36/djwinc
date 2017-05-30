class Search < ApplicationRecord
  def search_items
    items = Item.where(in_stock: true)

    items = items.where(["description LIKE ?","%#{keywords}%"]) if keywords.present?
    items = items.where(["category LIKE ?",category]) if category.present?
    items = items.where(["price_cents >= ?",min_price]) if min_price.present? && min_price != 0
    items = items.where(["price_cents <= ?",max_price]) if max_price.present? && max_price != 0

    items
  end
end
