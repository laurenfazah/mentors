class Profile < ApplicationRecord
  belongs_to :company
  has_many :profile_skills
  has_many :skills, through: :profile_skills
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :skills

end
