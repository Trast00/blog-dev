class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def recent_post
    Post.where(author: self).order(created_at: :desc).limit(3)
  end
end
