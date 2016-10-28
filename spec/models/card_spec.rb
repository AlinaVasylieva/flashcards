require 'rails_helper'

describe Card do
  it "has a valid factory"
    Factory.create(:card).to be_valid
  end

  it "is invalid without original_text "
    card = Card.new(:original_text =>nil)
    card.valid?
    expect(card.errors[:original_text]).to include("Can't be blank")
  end

  it "is invalid without translated_text " 
    card = Card.new(:translated_text =>nil)
    card.valid?
    expect(card.errors[:translated_text]).to include("Can't be blank")
  end

  it "is fetching a review_date"
    card = Card.new(:original_text, :translated_text)
    expect(card.review_date).to eq(Date.today+3.days)
  end

  it "is invalid if original_text equals to translated_text"
    card = Card.new(:original_text, :translated_text)
    expect(card.original_text).not_to eq(card.translated_text)
    expect(card.errors[:original_text, :translated_text]).to include("Original text must be different from Translated text")
  end
end
