require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let(:user) { FactoryBot.create(:user, name: 'test1', email: 'test1@example.com', image_name: 'default_user.jpg') }
  
  before do
    FactoryBot.create(:post, content: '最初の投稿', post_image: 'default_post.jpg', user_id: 1, post_document_image: '3.jpg')
    login(user)
  end
  
  describe 'testがログインしているとき' do
    it 'testの投稿にいいね！を押下し成功する' do
      visit "/posts/1"
      find(".fa").click
      expect(current_path).to eq "/posts/1"
      expect(page).to have_css(".like-btn-unlike")
    end
    
    it 'testの投稿のいいね！を解除する' do
      visit "/posts/1"
      find(".fa").click
      find(".fa").click
      expect(current_path).to eq "/posts/1"
      expect(page).to have_css(".like-btn")
    end
    
    it 'testのいいね！投稿をユーザー詳細ページで表示' do
      visit "/posts/1"
      find(".fa").click
      visit "/users/1"
      click_on "いいね！"
      expect(page).to have_content "最初の投稿"
    end
  end
end