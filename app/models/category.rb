class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products #NEEDS TO HAVE LINE ABOVE, JOINT TABLE CALLED EXACTLY category_products, product_id, category_id, TABLES CALLED categories AND products
end
