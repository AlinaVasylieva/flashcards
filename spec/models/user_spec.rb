require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    Card.destroy_all
    @user = create(:user)
    @card = create(:card)
    @user.cards << @card
  end

  it "has_many cards" do
    expect(@user).to have_many(@cards)
  end
end


