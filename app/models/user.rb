class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { small: "200x200", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                            :url  => "/assets/products/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  belongs_to :location
  belongs_to :profile
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :profile
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  # def attach_dependencies(params)
  #   formatted = Formatter.downcase_all(params[:location_attributes])
  #   formatted_more = Formatter.downcase_all(params[:profile_attributes][:company_attributes])
  #   self.location = Location.find_or_create_by(formatted)
  #   company = Company.find_or_create_by(formatted_more)
  #   self.profile = Profile.create(company: company)
  #
  # end
end
