class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 10...200}
  belongs_to :supplier
  has_many :images 
  has_many :orders

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

end
