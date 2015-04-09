class Api::ListingsController < ApplicationController

  def index
    render json: Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing, include: [:amenities, :home_type, :reviews]
  end

  def search
    # @listings = search_listings(search_params)
    @listings = Listing.all
    render json: @listings
  end

  private

  def search_params
    # defaults and more later
    params[:search_data]
  end

  def search_listings

  end

end
