class RemoveLikeRefToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :like, foreign_key: true
  end
end
