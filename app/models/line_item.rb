class LineItem < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :cart
  belongs_to :order, optional: true
end
