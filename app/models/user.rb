class User < ApplicationRecord
  has_secure_password


  has_attached_file :avatar, styles: { small: "200x200", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                            :url  => "/assets/products/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  belongs_to :location
  belongs_to :profile

  # validates_confirmation_of :password
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  validates :email, uniqueness: true

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :profile

  def name
    "#{first_name} #{last_name}"
  end
end
