class CardsController < ApplicationController
  def index
  	@cards = Card.all
  end

  def show
  	@card = Card.find(params[:id])
 end

  def new
    @card = Card.new
  end

  def create
  #Card.create(params[:card])
    card = Card.new(card_params)
 
   if card.save
     redirect_to card_path(card)
   else
     redirect 'new'
   end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @acard
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
 
    if @card.destroy
      render text: 'Card is successfully deleted!'
    else
      redirect_to card_path(card)
    end
  end
 
private
  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
