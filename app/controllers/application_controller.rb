class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def not_authenticated
    redirect_to login_url, :alert => "Please login to access this page" if current_user.nil?
  end
end
