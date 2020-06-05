class ImproveMessagesTable < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :messages, :sender_id then 
    else 
      add_column :messages, :sender_id, :integer
    end
    if column_exists? :messages, :receiver_id then 
    else 
      add_column :messages, :receiver_id, :integer
    end
  end
end
