class ProductsController < ApplicationController
  # def products_all
  #   products = Product.all
  #   render json: products.as_json
  # end

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    requested_id = params[:id]
    product = Product.find_by(id: requested_id)
    render json: product.as_json
  end

  def create
    the_name = params[:name]
    the_price = params[:price]
    the_imageurl = params[:image_url]
    the_desc = params[:description]

    new_product = Product.new(
      name: the_name, 
      price: the_price, 
      image_url: 
      the_imageurl, description: 
      the_desc
    )

    new_product.save
    render json: new_product.as_json
  end

  def update
    new_thing = params[]
    render json: {message: "youre in update"}
  end

end
