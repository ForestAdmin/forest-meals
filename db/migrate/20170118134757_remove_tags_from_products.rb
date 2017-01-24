class RemoveTagsFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :tags
  end
end
