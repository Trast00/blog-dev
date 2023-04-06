class RemoveCommentCountToPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :comments_count, :integer
  end
end
