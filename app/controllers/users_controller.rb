class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      render json: @user
    else
      errors = @user.errors.full_messages.to_json
      render json: errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
