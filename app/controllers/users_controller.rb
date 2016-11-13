class UsersController < ApplicationController
  #has_secure_password validations: false

  def index
    #render 'show'
  end

  def new
    @user = current_user.new
  end

  def show
  end

  def create
    @user = current_user.new(user_params)
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
    if current_user.update(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    #params.require(:user).permit(:email, :salt, :encrypted_password)
  end
end
