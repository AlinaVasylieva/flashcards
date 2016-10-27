class HomeController < ApplicationController

  def index
    @card = Card.random_card
  end

  def check
    result = Trainer.call(
      card_id: params[:id],
      original_text: params[:q]
    )
    redirect_to root_path, notice: result.notice
  end

end
