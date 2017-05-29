class AddAppraisalDataToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :appraisal_data, :text
  end
end
