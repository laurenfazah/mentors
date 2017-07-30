FactoryGirl.define do
  factory :profile do
    bio Faker::ChuckNorris.fact
    company
  end
end
