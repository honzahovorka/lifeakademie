class AddDefaultValueToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :paid, :boolean, :default => false
  end
end
