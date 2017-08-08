require 'rails_helper'

feature "mentor can log in" do
  scenario "mentor logs in and sees personal info" do
    user = create(:user, role: 1)
    visit '/'

    click_on "I am already a mentor!"

    expect(current_path).to eq(login_path)

    fill_in "Email:", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_path(user))

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.company)
    expect(page).to have_content(user.city)
    expect(page).to have_content(user.state)
    expect(page).to have_content(user.timezone)
    expect(page).to have_content(user.email)
    expect(page).to have_button("Show Password")
    expect(page).to have_link("Log Out")
  end
end
