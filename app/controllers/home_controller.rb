class HomeController < ApplicationController
  before_action :set_auth

  def index
    @card = current_user.cards.random_card.first
  end

  def check
    result = Trainer.call(
      card_id: params[:card_id],
      original_text: params[:q],
      user: current_user 
    )
    redirect_to root_path, notice: result.notice
  end

  private
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end
