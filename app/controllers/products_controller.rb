class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  def index
    @products = Product.all
  end


private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end

end
