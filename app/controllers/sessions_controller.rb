class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice =>"Logged in successfully"
    else
      flash.now.allert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out successfully"
  end
end
