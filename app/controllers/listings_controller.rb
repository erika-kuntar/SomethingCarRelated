class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @listings = Listing.all
    @product = Product.find(params[:product_id])
    @listings = @product.listings
    if params[:search]
      @search_term = params[:search]
      @listings = @listings.search_by(@search_term)
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @listing = @product.listings.new
  end

  def create
    @product = Product.find(params[:product_id])
    @listing = @product.listings.new(listing_params)
    if @listing.save
      redirect_to product_listings_path(@product), notice: "You added a listing!"
    else
      render :new
    end
  end

private

  def listing_params
    params.require(:listing).permit(:model, :year, :color)
  end

end
