class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true #allows empty foreign key
  belongs_to :product
end
