class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', counter_cache: true

  def recent_comment
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end

  def self.update_post_counter(user, new_value)
    user.update(posts_count: new_value)
  end
end
