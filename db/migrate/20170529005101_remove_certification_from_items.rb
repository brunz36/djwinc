class RemoveCertificationFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :certification, :text
  end
end
