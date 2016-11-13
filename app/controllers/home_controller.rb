class HomeController < ApplicationController

  def index
    @card = current_user.cards.random_card.first
  end

  def check
    result = Trainer.call(
      card_id: params[:card_id],
      original_text: params[:q],
      user: current user 
    )
    redirect_to root_path, notice: result.notice
  end

end
