class HomeController < ApplicationController
  
  def index
    @card = Card.random_card
  end

  def check
    @card = Card.find(params[:card_id])
    if @card.original_text == params[:q]
      redirect_to home_path, notice: "Correct!"
    else
      redirect_to home_path, notice: "Wrong! Try again"
    end 
  end

end
