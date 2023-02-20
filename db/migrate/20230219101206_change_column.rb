class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :likes_count, :integer, :default => 0

  end
end
