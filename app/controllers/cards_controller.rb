class CardsController < ApplicationController
  def index
  	@cards = Card.all
  end

  def show
  	@card = Card.find(params[:id])
  end

  def new
  end

  def create
    @card = Card.new((params.require(:cards).permit(:original_text, :translated_text)))
    @card.save
    redirect_to @card
  end
end
