class OrdersController < ApplicationController

  def create
    order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
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

    if current_user
      render json: the_order.as_json
    else
      render json: {message: "You need to be logged in in order to see the selected order."}
    end
  end

end
