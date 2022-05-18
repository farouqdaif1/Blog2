class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  def updates_comments_counter
    posts.increment!(:comments_counter)
  end
end
