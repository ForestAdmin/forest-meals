class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :type
      t.text :description
      t.text :instructions
      t.string :tags, array: true, default: []
      t.string :ingredients, array: true, default: []

      t.timestamps
    end
  end
end
