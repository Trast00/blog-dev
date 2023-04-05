class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', counter_cache: true

  def recent_comment
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_count)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_count, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :comments_count, numericality: { only_integer: true, greater_or_equal_to: 0}
end
