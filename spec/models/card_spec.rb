require 'rails_helper'

describe Card do

  it "has a valid factory" do
    card = Card.destroy_all
    expect(create(:card, {user_id: create(:user).id})).to be_valid
  end

  it "is invalid without original_text " do
    card = Card.create(:original_text =>nil)
    expect(card.errors[:original_text]).to include("can't be blank")
  end

  it "is invalid without translated_text " do
    card = Card.create(:translated_text =>nil)
    expect(card.errors[:translated_text]).to include("can't be blank")
  end

  it "is fetching a review_date" do
    Card.destroy_all
    card = create(:card, {user_id: create(:user).id})
    expect(card.review_date).to eq(Date.today + 3.days)
  end

  it "is invalid if original_text equals to translated_text" do
    card = Card.create(original_text: 'test', translated_text: 'test') 
    expect(card.errors.values).to include(["Original text must be different from Translated text"])
  end

  it "returns a random card by expired date" do
    expect(Card.random_card.to_sql).to include('RANDOM()')
  end

  it "belongs_to user" do
    association = Card.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end
end
