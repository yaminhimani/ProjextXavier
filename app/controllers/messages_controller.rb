class MessagesController < ApplicationController
  before_action :require_user

  def create
    message= current_user.messages.build(message_params)  #makes a link between the curent user and their message 
    if message.save
      redirect_to root_path
    end
  end 

  private

  def message_params
    params.require(:message).permit(:body)
  end
end 