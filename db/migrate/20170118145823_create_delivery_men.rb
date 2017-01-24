class CreateDeliveryMen < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_men do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :location
      t.boolean :available

      t.timestamps
    end
  end
end
