class Post < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :like
  has_many :comment
  def updates_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comment.limit(3).order(created_at: :desc)
  end
end
