class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mtname, :string
  end
end
