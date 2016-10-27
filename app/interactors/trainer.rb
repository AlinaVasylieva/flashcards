class Trainer
  include Interactor

  def call
    context.card = Card.find(context.card_id)
    if context.card.original_text == context.original_text
      context.card.update(review_date: Date.today+3.days)
      context.notice = "Correct!"
    else
      context.notice =  "Wrong! Try again"
    end
  end 

end
