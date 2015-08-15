require 'rails_helper'

feature 'Searching' do
  let(:user){build(:user)}
  before (:each) do
    visit root_path
  end

  scenario 'user search for events by location' do 
    fill_in "address" , with: 'New York'
    click_button "Search"
    expect(page).to have_content "results for"

  end

  scenario 'user search for events by artist' do
    fill_in "artist", with: 'Madonna'
    click_button "Search"
    expect(page).to have_content "results for"
  end 

  scenario 'logged in user can view his profile' do
    sign_up
    click_button "Profile"
    expect(page).to have_content "Signed in successfully."
  end
end
