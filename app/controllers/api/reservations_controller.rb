class Api::ReservationsController < ApplicationController
  def index
    render json: current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    if @reservation.user != current_user && @reservation.listing.owner != current_user
      render json: 'you are not affiliated with that reservation'
    else
      render json: @reservation
    end
  end
end
