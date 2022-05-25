class Post < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :like, dependent: :destroy
  has_many :comment, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  def updates_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comment.limit(3).order(created_at: :desc)
  end
end
