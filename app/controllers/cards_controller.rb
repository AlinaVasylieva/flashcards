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
    render plain: params[:pay_cards].inspect
  end
end
