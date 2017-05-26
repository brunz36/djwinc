class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sub_total
    sub_total = 0
    line_items.each do |line_item|
      sub_total += line_item.item.price
    end
    sub_total
  end

  def sales_tax
    sales_tax = 0
    line_items.each do |line_item|
      sales_tax += line_item.item.price * 0.07
    end
    sales_tax
  end
end
