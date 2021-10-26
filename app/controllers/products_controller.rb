class ProductsController < ApplicationController
  # def products_all
  #   products = Product.all
  #   render json: products.as_json
  # end

  def index
    p current_user
    products = Product.all
    render json: products
  end

  def show
    requested_id = params[:id]
    product = Product.find_by(id: requested_id)
    render json: product
  end

  def create
    the_name = params[:name]
    the_price = params[:price]
    the_desc = params[:description]
    the_supp_id = params[:supplier_id]

    new_product = Product.new(
      name: the_name, 
      price: the_price,
      description: the_desc,
      supplier_id: the_supp_id
    )
    new_product.save
    if new_product.save
      render json: new_product
    else
      render json: {error: new_product.errors.full_messages}
    end

  end

  def update
    requested_id = params[:id]
    product = Product.find_by(id: requested_id)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.save
    if product.save
      render json: product
    else
      render json: {error: product.errors.full_messages}
    end
  end

  def destroy
    requested_id = params[:id]
    product = Product.find_by(id: requested_id)
    product.destroy
    render json: {message: "Your requested product has been destroyed"}
  end

end
