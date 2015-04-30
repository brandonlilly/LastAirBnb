class Api::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render json: @reviews, include: :user
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, include: :user
  end

end
