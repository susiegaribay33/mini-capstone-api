class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 10...200}

  belongs_to :supplier
  has_many :images 
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products #NEEDS TO HAVE LINE ABOVE, JOINT TABLE CALLED EXACTLY category_products, product_id, category_id, TABLES CALLED categories AND products
  has_many :carted_products
  has_many :orders, through: :carted_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end


end
