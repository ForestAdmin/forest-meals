class AddDeliveryAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_address, :string
  end
end
