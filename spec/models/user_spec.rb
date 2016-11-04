require 'rails_helper'

RSpec.describe User, type: :model do
  it "has_many cards" do
    association = User.reflect_on_association(:cards)
    expect(association.macro).to eq :has_many
  end
end
