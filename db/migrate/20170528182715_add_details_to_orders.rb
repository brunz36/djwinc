class AddDetailsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sub_total_cents, :integer
    add_column :orders, :sales_tax_cents, :integer
    add_column :orders, :total_cents,     :integer
  end
end
