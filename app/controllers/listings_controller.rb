class ListingsController < ApplicationController
  def index
    # @listings = Listing.all
    @product = Product.find(params[:product_id])
    @listings = @product.listings
  end

  def new
    @product = Product.find(params[:product_id])
    @listing = @product.listings.new
  end

  def create
    @product = Product.find(params[:product_id])
    @listing = @product.listings.new(listing_params)
    if @listing.save
      redirect_to product_listings_path(@product)
    else
      render :new
    end
  end

private

  def listing_params
    params.require(:listing).permit(:model, :year, :color)
  end

end
