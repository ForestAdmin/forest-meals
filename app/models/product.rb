class Product < ActiveRecord::Base
  has_and_belongs_to_many :orders

  enum product_type: [:main_dish, :side, :dessert]

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    s3_protocol: "https"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
