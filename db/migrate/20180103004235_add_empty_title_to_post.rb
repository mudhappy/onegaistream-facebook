class AddEmptyTitleToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :empty_title, :boolean, :default => false
  end
end
