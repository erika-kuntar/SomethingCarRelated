class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product_params = params.require(:product).permit(:name)
    @product.update(product_params)
    redirect_to @product
  end

end
