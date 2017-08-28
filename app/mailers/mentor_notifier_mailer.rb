class MentorNotifierMailer < ApplicationMailer

  def inform(user, params)
    @user = user
    @message = params[:message]
    @mentor = User.find(params[:mentor_id])
    mail(to: @mentor.email, subject: params[:subject]) 
  end
end
