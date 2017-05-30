class RemoveDetailsFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :center_stone, :string
    remove_column :items, :stones, :string
    remove_column :items, :size, :integer
  end
end
