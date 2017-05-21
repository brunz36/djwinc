class Order < ApplicationRecord
  enum pay_type: {
    "Credit Card" => 0
  }
end
