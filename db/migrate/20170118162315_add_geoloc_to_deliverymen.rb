class AddGeolocToDeliverymen < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_men, :geoloc, :string
  end
end
