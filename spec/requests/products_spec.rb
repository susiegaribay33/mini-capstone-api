require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "should return all products in db" do
      product = Product.create!(
        name: "Test Coffee",
        description: "just a test coffee",
        price: 3,
        supplier_id: 1
      )
      
      get "/products"
      products = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(products.length).to eq(1)
    end
  end
end
