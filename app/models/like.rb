class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  def self.update_like_counter(post, new_value)
    post.update(likes_count: new_value)
  end
end
