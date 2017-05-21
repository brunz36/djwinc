class ChangeIntegerLimitOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :phone_number, :integer, limit: 8
  end
end
