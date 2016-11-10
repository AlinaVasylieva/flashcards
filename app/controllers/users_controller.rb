class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  #has_secure_password validations: false

  def index
    #render 'show'
    @user = current_user
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
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
    if 
    @user = User.find(params[:user_id])
    if @user.update(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    #params.require(:user).permit(:email, :salt, :encrypted_password)
  end
end
