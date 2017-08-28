class UsersController < ApplicationController
  def show
    if current_user.nil?
      redirect_to root_path
    end
  end

  def new
    @user = User.new
    @user.build_location && @user.build_profile.build_company
  end

  def create
    generate_user
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      flash[:notice] = "#{@user.errors.messages.keys.join(" & ")} cannot be blank"
      render 'new'
    end
  end


  private

  def profile_params
    user_params[:profile_attributes]
  end

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password,
                                  :password_digest, :accepting_mentees,
                                  location_attributes: [:city, :state, :timezone],
                                  profile_attributes: [ [skill_ids: []], :title, [company_attributes: [:name]]])
  end

  def generate_user
    User.transaction do
      @user          = User.new(user_params)
      @user.location = Location.find_or_create_by!(format!(user_params[:location_attributes]))
      @user.profile  = Profile.create!(profile_something)
      @user.role = 1
    end
  end

  def format!(params)
    Formatter.capitalize_all(params)
  end

  def profile_something
    {company: Company.find_or_create_by!(format!(profile_params[:company_attributes])),
    title: profile_params[:title],
    skills: Skill.all_except(profile_params[:skill_ids])}
  end

end
