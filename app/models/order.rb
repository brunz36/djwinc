class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :first_name, :last_name, :address, :city, :email, :state, :pay_type, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :phone_number, numericality: true

  enum pay_type: {
    "Credit Card" => 0
  }

  def self.states
    %W{AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}
  end

  def order_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.item.price
    end
    sum
  end
end
