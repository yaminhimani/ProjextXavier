class RegistrationController < ApplicationController

  def new
    @user = User.new

  end 

  def index
  end 

  

  def newAccount
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have succesfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end 
  end 
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end 