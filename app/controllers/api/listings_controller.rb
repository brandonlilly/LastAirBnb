class Api::ListingsController < ApplicationController

  def index
    render json: Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    # render :show
    render json: @listing, include: :amenities
  end

end
