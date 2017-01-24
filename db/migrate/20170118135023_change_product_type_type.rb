class ChangeProductTypeType < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :type
    add_column :products, :type, :integer
  end
end
