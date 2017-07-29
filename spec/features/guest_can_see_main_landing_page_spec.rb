require 'rails_helper'

feature "guest sees main landing page" do
  scenario "guest sees 3 options" do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_link("I want to be a mentor!")
    expect(page).to have_link("I am already a mentor!")
    expect(page).to have_link("I am a student looking for a mentor!")
  end
end
