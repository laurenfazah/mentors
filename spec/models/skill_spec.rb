require 'rails_helper'

RSpec.describe Skill, type: :model do
  it {should have_many(:profile_skills)}
  it {should have_many(:profiles).through(:profile_skills)}

end
