class CreateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefs do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
