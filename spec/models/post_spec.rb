require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'farouq', photo: 'imagelink', bio: 'software enginner')
    @post = Post.create(user: @user, title: 'asd title', text: 'My hello')
  end

  subject { Post.new(title: 'Farouq Daif', text: 'link', comments_counter: 12, likes_counter: 10, user: @user) }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'if comments counter is float' do
    subject.comments_counter = 0.25
    expect(subject).not_to be_valid
  end

  it 'post counter must be an integer' do
    subject.comments_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'post counter must 0 or greater than not negative numbers' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'test recent_five_comments method' do
    expect(subject.most_recent_comments.length).to be(0)
  end

  it 'test update_post_counter method' do
    @post.updates_posts_counter
    expect(@user.posts_counter).to be(1)
  end
end
