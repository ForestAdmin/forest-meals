class AddMenuToChefs < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :chef
  end
end
