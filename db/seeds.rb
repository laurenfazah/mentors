class Seed

  def start
    create_admin
  end

  def create_admin
    User.create(first_name: "admin",
                last_name: "mcadmin",
                email: "admin@admin.com",
                password: "test",
                avatar: Faker::Avatar.image,
                profile: profile,
                location: location)

  end

  def profile
    Profile.create(bio: "hi",
                    company: company)
  end

  def company
    Company.create(name: "Turing")
  end

  def location
    Location.create(city: "Denver",
                    state: "CO",
                    timezone: Faker::Address.time_zone)
  end
end


Seed.new.start
