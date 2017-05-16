class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :metal
      t.string :center_stone
      t.text :certification
      t.string :stones
      t.integer :size
      t.text :appraisal
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
