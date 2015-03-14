class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :title
      t.text :content
      t.text :sender
      t.integer :sender_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
