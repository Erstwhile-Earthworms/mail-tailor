class AddRawHtmlFieldToLetters < ActiveRecord::Migration
  def change
    add_column :letters, :raw_html, :string
  end
end
