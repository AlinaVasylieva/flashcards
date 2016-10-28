require 'rails_helper'

describe Card do
  it "has a valid factory" do
    FactoryGirl.create(:card).to be_valid
  end

  it "is invalid without original_text " do
    card = Card.create(:original_text =>nil)
    expect(card.errors[:original_text]).to include("Can't be blank")
  end

  it "is invalid without translated_text " do
    card = Card.create(:translated_text =>nil)
    expect(card.errors[:translated_text]).to include("Can't be blank")
  end

  it "is fetching a review_date" do
    card = FactoryGirl.create :card
    expect(card.review_date).to eq(Date.today+3.days)
  end

  it "is invalid if original_text equals to translated_text" do
    card = FactoryGirl.create :card
    expect(card.original_text).not_to eq(card.translated_text)
    expect(card.errors[:original_text, :translated_text]).to include("Original text must be different from Translated text")
  end
  
  it "returns a random card by expired date" do
    expect(Card.random_card.to_sql).to include('RANDOM()')
end
