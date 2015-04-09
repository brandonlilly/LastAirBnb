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

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors.full_messages
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:listing_id, :start_date, :end_date, :guests)
  end

end
