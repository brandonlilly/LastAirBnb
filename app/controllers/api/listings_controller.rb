class Api::ListingsController < ApplicationController

  def index
    if params[:filter_data]
      @listings = filter_listings(search_params);
    else
      @listings = Listing.all
    end

    render json: @listings, include: [:cover_photo]
  end

  def show
    @listing = Listing.find(params[:id])
    render :show
  end

  private

  def search_params
    # defaults and more later
    params[:filter_data]
  end

  def filter_listings(filter_data)
    binds = {
      lat_min: filter_data['lat'][0],
      lat_max: filter_data['lat'][1],
      lng_min: filter_data['lng'][0],
      lng_max: filter_data['lng'][1]
    }

    if binds[:lng_min].to_f > binds[:lng_max].to_f
      Listing.where(<<-SQL, binds)
        listings.lng BETWEEN :lng_min AND 180
          OR listings.lng BETWEEN -180 AND :lng_max
      SQL
    else
      Listing.where(<<-SQL, binds)
        listings.lat BETWEEN :lat_min AND :lat_max
          AND listings.lng BETWEEN :lng_min AND :lng_max
      SQL
    end
  end

end
