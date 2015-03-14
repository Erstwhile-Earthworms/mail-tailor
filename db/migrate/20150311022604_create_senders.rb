class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.text :name
      t.text :url

      t.timestamps null: false
    end
  end
end
