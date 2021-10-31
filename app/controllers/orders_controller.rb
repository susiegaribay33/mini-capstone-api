class OrdersController < ApplicationController
  before_action :authenticate_user 

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")
    item_count = carted_products.count
    i = item_count
    while i < item_count
      product_id = carted_products[i].product_id
      product = Product.find(product_id)
      calc_subtotal = carted_products[i].quantity * product.price.to_i
      i += 1
    end

    calc_tax = calc_subtotal * 0.07
    calc_total = calc_tax + calc_subtotal

    order = Order.new(
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
      user_id: current_user.id
    )

    if order.save
      render json: {message: "You've created an order!"}
    else
      render json: {error: order.errors.full_messages}
    end
  end

  def index
    all_orders = Order.all

    if current_user
      render json: all_orders
    else
      render json: {message: "You need to be logged in in order to see your orders."}
    end

  end

  def show
    the_order = Order.find(params[:id])
    # order = Order.find_by(id: params[:id], user_id: current_user.id)

    if current_user
      render json: the_order
    else
      render json: {message: "You need to be logged in in order to see the selected order."}
    end
  end

end
