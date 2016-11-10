class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  #before_filter :require_login, :only => :cards
  #before_filter :authenticate_user!
  #before_filter :not_authenticated

  def index
  	@cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
 
   if @card.save
     redirect_to card_path(@card)
   else
     render 'new'
   end
  end

  def edit 
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to :cards, flash: { notice: t('Card is successfully deleted') }
  end
 
  def set_card
  @card = Card.find(params[:id])
  end

private
  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
