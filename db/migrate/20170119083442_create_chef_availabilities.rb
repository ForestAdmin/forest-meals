class CreateChefAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_availabilities do |t|
      t.references :chef
      t.datetime :available_at
    end
  end
end
