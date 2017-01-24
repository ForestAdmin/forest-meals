class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :products

  enum status: [:payment_processing, :payment_confirmed, :processed]

  def total
    self.products.sum(&:price)
  end
end
