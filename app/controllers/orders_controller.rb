class OrdersController < ApplicationController
  before_action :authenticate_user 

  def create
    product = Product.find(params[:product_id])
    calc_subtotal = params[:quantity].to_i * product.price
    calc_tax = calc_subtotal * 0.07
    calc_total = calc_tax + calc_subtotal

    order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
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
      render json: all_orders.as_json
    else
      render json: {message: "You need to be logged in in order to see your orders."}
    end

  end

  def show
    the_order = Order.find(params[:id])
    # order = Order.find_by(id: params[:id], user_id: current_user.id)

    if current_user
      render json: the_order.as_json
    else
      render json: {message: "You need to be logged in in order to see the selected order."}
    end
  end

end
