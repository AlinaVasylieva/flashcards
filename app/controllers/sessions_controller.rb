class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    @current_user = User.find(session[:user_id])
    redirect_to root_url, :notice =>'Signed in successfully'
    #user = login(params[:email], params[:password], params[:remember_me])
    #if user
      #redirect_back_or_to root_url, :notice =>'Logged in successfully'
    #else
      #flash.now.alert = 'Invalid email or password'
      #render 'new'
    #end

    #user = User.where(email: params[:email]).first
      #if user && user.authenticate(params[:password])
        #session[:user_id] = user.id
        #redirect_to root_url, :notice => "You signed in successfully"
      #else
        #flash.now.alert = "Invalid email or password"
        #render 'new'
      #end
      
      #Omniauth
      #auth = requires.env['omniauth.auth']
      #session[:omniauth] = auth.expect('extra')
      #user = User.sign_in_from_omniauth(auth)
      #
  end

  def destroy
    logout
    session[:omniauth] = nil
    redirect_to root_url, :notice =>'Logged out successfully'
  end

  def failure
    redirect_to root_url, :alert =>'Authentication failed, please try again'
  end
end
