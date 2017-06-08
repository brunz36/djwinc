class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  validates :first_name, :last_name, :address, :city, :email, :state, :pay_type, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :phone_number, numericality: true
  validates :terms_conditions, acceptance: { accept: '1' }

  enum pay_type: {
    "Credit Card" => 0
  }

  monetize :sub_total_cents
  monetize :sales_tax_cents
  monetize :total_cents


  def self.states
    %W{AL AZ AR CA CO CT DE FL GA ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}
  end
end
