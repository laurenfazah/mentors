FactoryGirl.define do

  factory :location do
    city Faker::Address.city
    state Faker::Address.state
    timezone Faker::Address.time_zone
  end


  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
    avatar Faker::Avatar.image
    profile
    location
  end
end
