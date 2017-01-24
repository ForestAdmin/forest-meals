class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :image
  end
end
