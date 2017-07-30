class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "You have successfully logged out"
  end

end
