class Like < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id
  def updates_likes_counter
    post.increment!(:likes_counter)
  end
end
