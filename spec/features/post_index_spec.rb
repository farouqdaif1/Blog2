require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'farouq', photo: 'image', bio: 'Developer from Egypt', email: 'test@email.com',
                        password: 'password', confirmed_at: Time.now)
    @post = Post.create(user: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.post.create title: "Post number #{i}", text: "This is my #{i} post!"
      @post.updates_posts_counter
    end
    @comment = Comment.create(text: 'My first comment', user: @user, post_id: @post.id)
    @comment.updates_comments_counter
    @like = Like.create(user: @user, post_id: @post.id)
    @like.updates_likes_counter
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_posts_path @user.id
  end
  describe 'tests for view posts#index' do

    it 'name of user.' do
      expect(page).to have_content 'farouq'
    end

    it 'see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 5'
    end

    it 'see a posts title' do
      expect(page).to have_content 'title'
    end

    it 'see some of the posts body' do
      expect(page).to have_content 'text'
    end

    it 'see the first comments on a post' do
      expect(page).to have_content 'My first comment'
    end

    it 'see how many comments a post has' do
      expect(page).to have_content 'Comments: 1'
    end

    it 'see how many likes a post has' do
      expect(page).to have_content 'Likes: 1'
    end

    it 'When I click a user post, it redirects me to that post s show page.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content 'Comment'
      expect(page).to have_content 'Like'
      expect(page).to have_content 'Delete'
    end
  end
end