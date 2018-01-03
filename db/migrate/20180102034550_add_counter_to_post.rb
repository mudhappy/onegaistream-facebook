class AddCounterToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :counter, :integer, :default => 0
  end
end
