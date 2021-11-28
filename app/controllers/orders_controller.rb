class OrdersController < ApplicationController
  before_action :authenticate_user 

  def create
    carted_products = current_user.carted_products.where(status: "Carted")
    
    calc_subtotal = 0
    carted_products.each do |carted_product|
      calc_subtotal += carted_product.product.price * carted_product.quantity
    end
     
    tax_rate = 0.07
    calc_tax = calc_subtotal * tax_rate
    calc_total = calc_subtotal + calc_tax
    
    #create order in orders table
    order = Order.new(
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
      user_id: current_user.id
    )

    order.save

    # change status to purchased and add order id
    carted_products.each do |carted_product|
      carted_product.status = "Purchased"
      carted_product.order_id = order.id
      carted_product.save
    end

    render json: order.as_json
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
