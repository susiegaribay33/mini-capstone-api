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
    render json: all_orders.as_json
  end

end
