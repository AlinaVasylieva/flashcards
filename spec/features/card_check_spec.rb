require 'rails_helper'

RSpec.feature "Card check", :type => :feature do
  
  before do
    card = create(:card)
    card.update(review_date: 1.day.ago)
  end

  scenario "User checks the Card" do
    visit "/home"

    fill_in "Original Text", :with => "Hello"
    click_button "Check"

    expect(page).to have_text("Correct!")
  end
end
