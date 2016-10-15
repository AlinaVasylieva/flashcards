class PayCardsController < ApplicationController
  def new
  end

  def create
    render plain: params[:pay_cards].inspect
  end
end
