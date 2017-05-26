class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :first_name, :last_name, :address, :city, :email, :state, :pay_type, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :phone_number, numericality: true

  enum pay_type: {
    "Credit Card" => 0
  }

  def self.states
    %W{AL AZ AR CA CO CT DE FL GA ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}
  end

  # def move_items_to_portfolio
  #   line_items.each do |line_item|
  #     line_item.item.in_stock = false
  #   end
  # end
end
