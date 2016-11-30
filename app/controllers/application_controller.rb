class ApplicationController < ActionController::Base #.helper_method :current_user
  protect_from_forgery with: :exception
  #before_action :require_login
  
  def not_authenticated
    redirect_to login_url, :alert => "Please login to access this page" if current_user.nil?
  end
end
