class CreateProductsMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus_products do |t|
      t.references :product
      t.references :menu
    end
  end
end
