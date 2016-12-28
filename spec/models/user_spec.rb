require 'rails_helper'

RSpec.describe User, type: :model do
  it "has_many cards" do
    association = User.reflect_on_association(:cards)
    expect(association.macro).to eq :has_many
  end

  it "creates user when not exist in DB yet" do
    User.destroy_all
    expect { User.sign_in_from_omniauth({'provider' => 'facebook', 'uid' => '763292023904', 'info' => {'name' => 'Example User'}})}.to change{User.count}
  end
end
