require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user_one) { create(:user) }

  it {should belong_to(:location)}
  it {should belong_to(:profile)}
  it {should accept_nested_attributes_for(:location)}
  it {should accept_nested_attributes_for(:profile)}

  it { should define_enum_for(:role) }
end
