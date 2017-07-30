FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    stack "MyString"
  end
end
