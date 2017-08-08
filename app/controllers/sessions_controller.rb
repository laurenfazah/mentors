class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env["omniauth.auth"] != nil
      @user = User.create_oauth_user(request.env["omniauth.auth"]["info"])
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to dashboard_path(@user)
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "You have successfully logged out"
  end

  private

  def raw_info_from_oauth
    request.env["omniauth.auth"]["info"]
  end
end
