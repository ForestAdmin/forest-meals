class AddAllergenToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :allergens, :string, array: true, default: []
  end
end
