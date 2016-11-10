class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice =>"Logged in successfully"
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end

    #user = User.where(email: params[:email]).first
      #if user && user.authenticate(params[:password])
        #session[:user_id] = user.id
        #redirect_to root_url, :notice => "You signed in successfully"
      #else
        #flash.now.alert = "Invalid email or password"
        #render 'new'
      #end
  end

  def destroy
    #logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out successfully"
  end
end
