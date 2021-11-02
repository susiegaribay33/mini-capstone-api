class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted",
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def index
    # carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")
    carted_products = current_user.carted_products.where(status: "Carted")
    render json: carted_products.as_json
  end

  def destroy
    carted_product = Carted.find(params[:id])
    carted_product.status = "Removed"
    render json: {message: "Product has been removed from your cart"}
  end

end
