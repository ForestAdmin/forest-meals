class CreateMenusOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :menus_orders do |t|
      t.references :menu
      t.references :order
    end
  end
end
