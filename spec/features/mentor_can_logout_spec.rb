require 'rails_helper'

feature "mentor can logout" do
  scenario "logging out destroys session" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path(user)

    expect(page).to have_link("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end
