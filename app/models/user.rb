class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes

  def recent_post
    Post.where(author: self).order(created_at: :desc).limit(3)
  end

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
