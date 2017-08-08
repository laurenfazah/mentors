class Seed

  def start
    create_skills
    create_users
  end

  def create_users
    20.times do |i|
      user = User.create(first_name: "user#{i}",
                last_name: "mcadmin#{i}",
                email: "test@test.com#{i}",
                password: "test",
                avatar: Faker::Avatar.image,
                profile: profile,
                location: location,
                role: 1,
                accepting_mentees: [true, false].sample)
      puts "Created User: #{user.id} as a #{user.role}"
    end
  end

  def create_skills
    Skill.create(name: "Ruby")
    Skill.create(name: "HTML")
    Skill.create(name: "JavaScript")
    Skill.create(name: "Java")
    Skill.create(name: "CSS")
    Skill.create(name: "Go")
    Skill.create(name: "Clojure")
  end


  def profile
    profile = Profile.create(bio: Faker::ChuckNorris.fact,
                    company: company,
                    title: Faker::Company.profession,
                    skills: [Skill.find(rand(1..7)), Skill.find(rand(1..7))])
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
