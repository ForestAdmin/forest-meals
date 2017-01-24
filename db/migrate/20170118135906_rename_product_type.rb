class RenameProductType < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :type, :product_type
  end
end
