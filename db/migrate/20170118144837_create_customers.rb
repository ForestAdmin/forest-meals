class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
