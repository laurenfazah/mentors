class Skill < ApplicationRecord
  has_many :profile_skills
  has_many :profiles, through: :profile_skills
  scope :all_except, -> (id) {where.not id: 0}

end
