class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @user = User.new (params[:user])
    if @user.save
      redirect_to root_url, :notice =>"Signed up successfully"
    else
      render 'new'
    end
  end
end
