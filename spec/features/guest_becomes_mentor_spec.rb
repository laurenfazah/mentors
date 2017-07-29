require 'rails_helper'

feature "guest becomes mentor" do
  scenario "guest sees sign up page to become a mentor" do
    visit '/'

    click_on "I want to be a mentor!"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("First Name:")
    expect(page).to have_content("Last Name:")
    expect(page).to have_content("Email (For Login):")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")

    expect(page).to have_content("City:")
    expect(page).to have_content("State:")
    expect(page).to have_content("Timezone:")
    expect(page).to have_content("Company:")
    expect(page).to have_content("Title:")
    expect(page).to have_content("Areas of Expertise:")
    expect(page).to have_content("Accepting Mentees?")
    expect(page).to have_content("Upload a Photo:")
  end

  scenario "guest fills out correct information" do
    Skill.create(name: "Ruby")
    visit '/'

    click_on "I want to be a mentor!"

    fill_in "First Name:", with: "Ilana"
    fill_in "Last Name:", with: "Corson"
    fill_in "Email (For Login):", with: "test@test.com"
    fill_in "Password:", with: "test"
    fill_in "Password Confirmation:", with: "test"
    fill_in "City:", with: "Denver"
    fill_in "State:", with: "CO"
    select "Lima", from: :user_location_attributes_timezone
    fill_in "Company:", with: "Turing"
    fill_in "Title:", with: "Assistant Instructor"
    check("user_profile_attributes_skill_ids_1")
    # fill_in "Accepting Mentees?", with:
    # fill_in "Upcload a Photo:", with:

    click_on "Sign Up"

    visit dashboard_path(User.last)

    expect(page).to have_content("Ilana Corson")
    expect(page).to have_content("Turing")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Co")
    expect(page).to have_content("Lima")
    expect(page).to have_content("Turing")
    expect(page).to have_content("test@test.com")
    expect(page).to have_button("Show Password")
    expect(page).to have_content("Assistant Instructor")
    expect(page).to have_content("Ruby")
  end

  scenario "guest forgets some information" do
    visit '/'

    click_on "I want to be a mentor!"

    fill_in "First Name:", with: ""
    fill_in "Last Name:", with: "Corson"
    fill_in "Email (For Login):", with: "test@test.com"
    fill_in "Password:", with: "test"
    fill_in "Password Confirmation:", with: "test"
    # fill_in "Location:", with: "Denver"
    # fill_in "Company:", with: "Turing"
    # fill_in "Position:", with: "Teaching Assistant"
    # fill_in "Areas of Expertise:", with: "Ruby"
    # fill_in "Accepting Mentees?", with:
    # fill_in "Upload a Photo:", with:

    click_on "Sign Up"
  end
end
