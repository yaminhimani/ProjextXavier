class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  
  def self.find_conversation_partners(user_id)
    @user_id = user_id.to_i
    @receiver_ids = Message.where(:sender_id => @user_id).where("receiver_id is not null").pluck(:receiver_id).to_a
    @sender_ids = Message.where(:receiver_id => @user_id).where("sender_id is not null").pluck(:sender_id).to_a
    @message_ids = @sender_ids + @receiver_ids
    @message_ids = @message_ids.uniq
    return @message_ids 
  end 
  
  def self.prepare_messages_for_box(params)
    @user_1 = params["user_1"].to_i
    @user_2 = params["user_2"].to_i
    @array_of_users = [@user_1, @user_2]
    @messages = Message.where(:sender_id => @array_of_users).where(:receiver_id => @array_of_users)
    return @messages
  end
  
  def self.has_received_messages(user_id)
    @count = Message.where(:receiver_id => user_id.to_i).count
    if @count == 0 then return false else return true end
  end
  
  def self.has_any_messages(user_id)
    @count_sender_id = Message.where(:sender_id => user_id.to_i).count
    @count_receiver_id = Message.where(:receiver_id => user_id.to_i).count
    @total_count = @count_sender_id + @count_receiver_id
    if @total_count > 0 then return true else return false end
  end
  
end
