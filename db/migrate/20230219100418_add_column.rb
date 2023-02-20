class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :likes_count, :integer
    # t.integer :likes_count
  end
end
