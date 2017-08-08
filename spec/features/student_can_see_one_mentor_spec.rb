require 'rails_helper'

feature "student sees one mentor" do

  scenario "sees mentor show from index" do
    stub_omniauth
    visit '/'

    click_on "I am a student looking for a mentor!"

    mentors = create_list(:user, 5, role: 1)

    mentor = mentors.first
    mentor.profile.skills = [Skill.create(name: "Ruby"), Skill.create(name: "Rails")]

    click_on "Mentors"

    click_on("View My Profile", match: :first)

    expect(current_path).to eq(mentor_path(mentor))
    expect(page).to have_content(mentor.name)
    expect(page).to have_content(mentor.company)
    expect(page).to have_content(mentor.city)
    expect(page).to have_content(mentor.state)
    expect(page).to have_content(mentor.bio)
    expect(page).to have_content(mentor.skills.first.name)

    within('nav') do
      expect(page).to have_content("Log Out")
    end

    click_on "Log Out"

    expect(current_path).to eq(root_path)

    visit '/mentors'

    # expect(status_code).to eq(404)
  end
end
