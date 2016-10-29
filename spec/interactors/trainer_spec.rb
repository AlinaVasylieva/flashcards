require 'rails_helper'

describe Trainer do

  before do
    Card.destroy_all
  end

  it "is valid" do
    card = create(:card)
    result = Trainer.call(card_id: card.id, original_text: "Hello")
    expect(result.notice).to include("Correct!")
  end

  it "updates review_date when correct" do
    card = create(:card)
    result = Trainer.call(card_id: card.id, original_text: "Hello")
    expect(result.card.review_date).to eq(Date.today + 3.days)
  end
end
