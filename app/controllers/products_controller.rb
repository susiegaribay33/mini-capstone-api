class ProductsController < ApplicationController
  def products_all
    # products = Product.all
    # render json: products.as_json
    render json: {message: "products"}
  end

end
