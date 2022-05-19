class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id
  def updates_comments_counter
    post.increment!(:comments_counter)
  end
end
