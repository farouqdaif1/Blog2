class User < ApplicationRecord
  has_many :post
  has_many :comment
  has_many :like
  def most_recent_posts
    post.limit(3).order(created_at: :desc)
  end
end
