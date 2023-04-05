class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  def self.update_comment_counter(post, new_value)
    post.update(comments_count: new_value)
  end
end
