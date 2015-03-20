class AddDisplayNameToSenders < ActiveRecord::Migration
  def change
    add_column :senders, :display_name, :string
  end
end
