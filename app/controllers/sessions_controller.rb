class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(email, password)
    if @user
      log_in_user(@user)
      render json: @user
    else
      render json: 'Invalid credentials'.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    token = params[:id]
    Session.find_by_token(token).destroy!
    session[:token] = nil;
    redirect_to root_url
  end

end
