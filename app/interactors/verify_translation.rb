class VerifyTranslation
  include Interactor

  def check_card
     @card = Card.find(params[:card_id])
    if @card.original_text == params[:q]
      redirect_to home_path, notice: "Correct!"
    else
      redirect_to home_path, notice: "Wrong! Try again"
    end 
  end 
end
