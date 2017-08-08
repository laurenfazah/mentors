class User < ApplicationRecord
  has_secure_password
  default_scope { order(id: :asc) }

  has_attached_file :avatar, styles: { small: "200x200", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                            :url  => "/assets/products/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  belongs_to :location
  belongs_to :profile

  enum role: [:student, :mentor]

  validates_confirmation_of :password
  validates_attachment :avatar, presence: true,
                        content_type: { content_type: ['image/jpeg', 'image/png']},
                        size: { less_than: 5.megabytes }

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :profile

  def name
    "#{first_name} #{last_name}"
  end

  def company
    profile.company.name
  end

  def city
    location.city
  end

  def state
    location.state
  end

  def skills
    profile.skills
  end

  def bio
    profile.bio
  end

  def timezone
    location.timezone
  end

  def title
    profile.title
  end

  private
  
  def self.create_oauth_user(raw_info_from_oauth)
    user = User.find_or_create_by(uid: raw_info_from_oauth[:id])
    user.email = raw_info_from_oauth[:email]
    user.first_name = raw_info_from_oauth[:first_name]
    user.last_name = raw_info_from_oauth[:last_name]
    user.password_digest = SecureRandom.hex(8)
    user.avatar = raw_info_from_oauth[:image_url]
    user.profile = Profile.find_or_create_by(profile_params)
    user.location = Location.find_or_create_by(location_params)
    user.role = 0
    user.save
    return user
  end

  def self.profile_params
    { bio: "TURING STUDENT", company: Company.create(name: "Turing") }
  end

  def self.location_params
    { city: "Denver", state: "Co", timezone: "Mountain" }
  end

end
