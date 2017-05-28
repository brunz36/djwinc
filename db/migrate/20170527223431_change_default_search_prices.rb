class ChangeDefaultSearchPrices < ActiveRecord::Migration[5.0]
  def change
    change_column :searches, :min_price, :integer, default: 0
    change_column :searches, :max_price, :integer, default: 0
  end
end
