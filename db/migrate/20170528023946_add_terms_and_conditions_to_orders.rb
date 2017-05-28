class AddTermsAndConditionsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :terms_conditions, :string
  end
end
