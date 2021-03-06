require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'farouq', photo: 'image', bio: 'Developer from Egypt', email: 'test@email.com',
                        password: 'password', confirmed_at: Time.now)
    @post = Post.create(user: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.post.create title: "Post number #{i}", text: "This is my #{i} post!"
      @post.updates_posts_counter
    end
    @like = Like.create(user: @user, post_id: @post.id)
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_path @user.id
  end
  describe 'tests for view users#show' do
    it 'I can see the users profile picture.' do
      expect(page.find('img')['src']).to have_content @user.photo
    end

    it 'Can see the name of user' do
      expect(page).to have_content 'farouq'
    end

    it 'test the number of posts ' do
      expect(page).to have_content 'Number of posts: 5'
    end

    it 'see the users bio' do
      expect(page).to have_content 'Developer from Egypt'
    end

    it 'see the users first 3 posts' do
      expect(page).to have_content 'This is my 5 post!'
      expect(page).to have_content 'This is my 4 post!'
      expect(page).to have_content 'This is my 3 post!'
      expect(page).to have_no_content 'This is my 2 post!'
    end

    it 'can see a button that lets me view all of a users posts.' do
      expect(page.find('a', text: 'See all posts')).to have_content 'See all posts'
    end

    it 'When I click a user post, it redirects me to that post s show page.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content 'Comment'
      expect(page).to have_content 'Like'
      expect(page).to have_content 'Delete'
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_on 'See all posts'
      expect(current_path).to eq user_posts_path user_id: User.last.id
    end
  end
end
