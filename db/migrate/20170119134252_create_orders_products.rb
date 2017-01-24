class CreateOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_products do |t|
      t.references :order
      t.references :product
    end
  end
end
