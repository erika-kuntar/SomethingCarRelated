class ListingsController < ApplicationController
  def index
    # @listings = Listing.all
    @product = Product.find(params[:product_id])
    @listings = @product.listings
  end
end
