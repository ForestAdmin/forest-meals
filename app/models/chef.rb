class Chef < ApplicationRecord
  has_many :chef_availabilities
  has_many :menus
  has_many :orders, through: :menus
  has_many :products, through: :menus
end
