require 'rails_helper'

feature "student logs in through census" do
  scenario "oauth through census" do
    stub_omniauth
    visit '/'
    click_on "I am a student looking for a mentor!"

    expect(page).to have_content("Ilana")
    expect(page).to have_content("Corson")
    expect(page).to have_content("test@test.com")

    within('nav') do
      expect(page).to have_content("Mentors")
    end
  end
end
