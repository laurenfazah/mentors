require 'rails_helper'

RSpec.describe Profile, type: :model do
  it {should belong_to(:company)}
  it {should have_many(:profile_skills)}
  it {should have_many(:skills).through(:profile_skills)}
  it {should accept_nested_attributes_for(:skills)}
  it {should accept_nested_attributes_for(:company)}

end
