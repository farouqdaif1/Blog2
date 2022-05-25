require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'farouq', photo: 'image', bio: 'Developer from Egypt', email: 'daiffarouq@email.com',
                          password: 'password', confirmed_at: Time.now)
      @post = Post.create(user: @user, title: 'title', text: 'text')
      @comment = Comment.create(text: 'My first comment', user: @user, post_id: @post.id)
      @like = Like.create(user: @user, post_id: @post.id)
      get user_posts_path(@user.id)
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template('posts/show')
    end

    before(:each) do
      get user_post_path(@user.id, @post.id)
    end
    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'renders content correctly' do
      expect(response.body).to include('post Details')
    end
  end
end
