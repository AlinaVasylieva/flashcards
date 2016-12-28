require 'rails_helper'

RSpec.feature "User", :type => :feature do
  
  before do
    @user = create(:user)
  end

  scenario "User updates account" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "users/:id/edit"
    fill_in "Email", :with => "example@example.com"
    click_button "Update User"
    expect(page).to have_text('Profile successfully updated')
  end
end
