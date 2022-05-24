class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Post do |post|
      post.user == user
    end
    can :manage, Comment do |post|
      post.user == user
    end
  end
end
