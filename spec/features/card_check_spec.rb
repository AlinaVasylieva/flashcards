require 'rails_helper'

RSpec.feature "Card check", :type => :feature do
  
  before do
    @user = create(:user)
    card = create(:card, {user_id: @user.id})
    card.update(review_date: 1.day.ago)
  end

  scenario "User checks the Card" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/home"
    fill_in "Original Text", :with => "Hello"
    click_button "Check"
    expect(page).to have_text('Correct!')
  end
end
