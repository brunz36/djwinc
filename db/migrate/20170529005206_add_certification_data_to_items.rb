class AddCertificationDataToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :certification_data, :text
  end
end
