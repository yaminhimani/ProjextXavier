class AddIpAndBrowserToUser < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :users, :ip_and_browser then 
    else   
      add_column :users, :ip_and_browser, :string  
    end
  end
end
