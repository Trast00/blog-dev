class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  validates :text, presence: true

  def as_json(_options = {})
    {
      id:,
      text:,
      author_id:,
      post_id:
    }
  end

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:comments_count)
  end
end
