class NotificationsController < ApplicationController

  def create
    MentorNotifierMailer.inform(current_user, params).deliver_now
    redirect_to mentor_path(params[:mentor_id])
  end

  def new
    @mentor = User.find(params[:mentor_id])
    render :new
  end
end
