class MentorsController < ApplicationController
  def index
    @mentors = User.where(role: 1)
  end

  def show
    @mentor = User.find(params[:id])
  end
end
