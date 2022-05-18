class Post < ApplicationRecord
  belongs_to :users
  has_many :likes
  has_many :comments
  def updates_posts_counter
    users.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.limt(3).order(created_at(:desc))
  end
end
