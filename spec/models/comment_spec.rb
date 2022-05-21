require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment test cases validations' do
    before(:each) do
      @user = User.new(name: 'farouq', photo: 'imagelink', bio: 'software enginner')
      @post = Post.new(user: @user, title: 'asd title', text: 'My hello')
      @comment = Comment.new(text: 'First comment', user: @user, post: @post)
    end

    it 'text should be present' do
      @comment.text = 'test'
      expect(@comment).to be_valid
    end

    it 'if post_id is integer' do
      @comment.post_id = '123'
      expect(@comment).to_not be_valid
    end

    it 'if post_id is integer' do
      @comment.updates_comments_counter
      expect(@post.comments_counter).to be(1)
    end
  end
end
