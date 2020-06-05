class ChatroomController < ApplicationController
  before_action :require_user 

  def index
    @logged_user = nil
    
    if session[:user_id].to_s != "" then 
      puts "User id: " + session[:user_id].to_s
      @user_id = session[:user_id].to_i
      @logged_user = User.find_by_id(@user_id) 
      @has_received_messages = Message.has_received_messages(@user_id)
      @has_any_messages = Message.has_any_messages(@user_id)
      @admins = User.admins_of_logged_user(@user_id)
      #puts "Admins count: " + @admins.to_s
      @guests_or_users = User.guests_of_users_of_logged_user(@user_id)
      @clients_without_messages = User.clients_without_messages
    end
    
    @message= Message.new
    @messages= Message.none
  end

end
