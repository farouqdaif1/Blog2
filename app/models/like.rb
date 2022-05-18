class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  def updates_likes_counter
    posts.increment!(:likes_counter)
  end
end
