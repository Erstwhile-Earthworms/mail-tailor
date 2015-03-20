class AddCategoryToLetters < ActiveRecord::Migration
  def change
    add_column :letters, :category, :string
  end
end
