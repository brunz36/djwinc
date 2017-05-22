class AddPriceCentsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price_cents, :integer
  end
end
