require 'rails_helper'

RSpec.describe ProfileSkill, type: :model do
  it {should belong_to(:profile)}
  it {should belong_to(:skill)}

end
