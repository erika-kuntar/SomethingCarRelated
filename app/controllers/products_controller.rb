class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @products = Product.alphabetical
    @products = Product.alphabetical
    if params[:search]
      @search_term = params[:search]
      @products = @products.search_by(@search_term)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: "Product successfully updated!"
    else
      render :edit
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url(@product), notice: "Thanks for adding!"
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, alert: "Product successfully deleted!"
  end

end

private

  def product_params
    params.require(:product).permit(:name)
  end
