class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:comments_count)
  end
end