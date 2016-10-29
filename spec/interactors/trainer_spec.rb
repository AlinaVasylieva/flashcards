require 'rails_helper'

describe Trainer do
  
  context "when correct" do
    card = Trainer.call(card_id: ["17"], original_text: ["First Card"])
    expect (card.notice).to include("Correct!")

  end

  it "updates review_date when correct" do
    card = Trainer.call(card_id: ["29"], original_text: ["Do you speak (English/ Polish)"])
    expect(card.review_date).to ed(Date.today + 3.days)
  end
end
