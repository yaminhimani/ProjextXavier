class AddUserTypesToUsers < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :users, :user_type then 
    else 
      add_column :users, :user_type, :string
    end
  end
end
