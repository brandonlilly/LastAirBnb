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
      redirect_to root_url
    else
      @user = User.new(email: email)
      flash.now[:errors] = ["Invalid login information"]
      render :new
    end
  end

  def destroy
    token = params[:id]
    Session.find_by_token(token).destroy!
    session[:token] = nil;
    redirect_to root_url
  end

end
