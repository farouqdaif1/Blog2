class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :post, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_posts
    post.limit(3).order(created_at: :desc)
  end
end
