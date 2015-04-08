class Api::ListingsController < ApplicationController

  def index
    render json: Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing, include: [:amenities, :home_type, :reviews]
  end

end
