class SessionsController < ApplicationController

before_action :logged_in_redirect, only: [:new, :create]

  def new

  end

  def guest #the method to log in as a guest 
    user = User.find(9)
    session[:user_id] = user.id
    flash[:sucess]= "You are now chatting as a guest"
    redirect_to root_path 
  end 


def create
  user = User.find_by(username: params[:session][:username]) #Try to find the username of on the account 
  if user && user.authenticate(params[:session][:password])   #check to see if there is that user on file and he
    session[:user_id] = user.id
    flash[:sucess]= "You have successfully logged in"
    redirect_to root_path 
  else
    flash.now[:error]= "There login information incorect"
    render 'new'
  end
end 
  

def destroy
  session[:user_id] = nil
  flash[:success] = "You have successfully logged out"
  redirect_to login_path
end

private

def logged_in_redirect
  if logged_in?
    flash[:error] = "You are already logged in "
    redirect_to root_path
  end 
end 

end 