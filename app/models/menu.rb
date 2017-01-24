class Menu < ApplicationRecord
  belongs_to :chef
  has_and_belongs_to_many :products
  has_many :orders, through: :products
end
