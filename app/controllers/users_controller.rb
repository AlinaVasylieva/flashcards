class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice =>"Signed up successfully"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
