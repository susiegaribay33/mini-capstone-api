class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: {message: "hello"}
  end

end
