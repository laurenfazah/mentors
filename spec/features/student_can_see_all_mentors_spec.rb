require 'rails_helper'

feature "student can see all mentors" do
  scenario "student sees mentors accepting and not accepting students" do
    mentors = create_list(:user, 3, role: "mentor", accepting_mentees: false)

    stub_omniauth

    visit '/'

    click_on "I am a student looking for a mentor!"

    click_on "Mentors"

    expect(current_path).to eq(mentors_path)
    expect(page).to have_content(mentors.first.name)
    expect(page).to have_content(mentors.first.city)
    expect(page).to have_content(mentors.first.state)
    expect(page).to have_content(mentors.first.timezone)
    expect(page).to have_content(mentors.first.skills[0])
    expect(page).to have_content("Not Accepting Mentees")
    expect(page).to have_button("View My Profile")
    expect(page).to have_button("Message Me!")
  end
end
