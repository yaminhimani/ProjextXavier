class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15 } 
  has_secure_password
  has_many :messages

  def self.find_or_create_guest(params, request)
    @count_users = User.all.count
    @ip_and_browser = request.remote_ip.to_s + ";" + request.env['HTTP_USER_AGENT'].to_s
    @guest = User.where(:user_type => 'Guest').where(:ip_and_browser => @ip_and_browser).first
    if @guest == nil then 
      @guest = User.new 
      @guest.username = "Guest" + SecureRandom.hex(2).to_s
      @guest.user_type = "Guest"
      @guest.password = "guest"
      @guest.ip_and_browser = @ip_and_browser
      @guest.save
    end
    return @guest
  end
  
  def self.admins_of_logged_user(user_id)
    @partner_ids = Message.find_conversation_partners(user_id)
    @admins = User.where(:user_type => 'Admin').where(:id => @partner_ids)
    return @admins
  end  
  
  def self.guests_of_users_of_logged_user(user_id)
    @partner_ids = Message.find_conversation_partners(user_id)
    @users = User.where(:user_type => ['User', 'Guest']).where(:id => @partner_ids)
    return @users
  end  
  
  def self.clients_without_messages
    @client_ids_with_messages = Message.all.pluck(:receiver_id).uniq.to_a
    @client_ids = User.where(:user_type => ['User', 'Guest']).pluck(:id).to_a
    @client_ids_without_messages = []
    if @client_ids.size > 0 then 
      for @client_id in @client_ids do 
        if !(@client_ids_with_messages.include? @client_id) then  
          @client_ids_without_messages.push(@client_id)
        end
      end
    end
    @clients_without_messages = User.where(:id => @client_ids_without_messages.uniq)
    return @clients_without_messages
  end
    
end
