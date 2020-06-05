class MessagesController < ApplicationController
  before_action :require_user

  def create
    message= current_user.messages.build(message_params)  #makes a link between the curent user and their message 
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    mod_message: message_render(message),
                                    sender_id: message.sender_id.to_i,
                                    receiver_id: message.receiver_id.to_i
    end
    #redirect_back(fallback_location: root_path)
  end 
  
  def messages 
    @messages = Message.prepare_messages_for_box(params)  
    render :layout => false
    #
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :sender_id, :body)
  end 
  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end 

  
end 
