require 'rails_helper'

RSpec.describe "Posts", type: :request do
  
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
    
    def post_valid_information
      get new_post_path(user)
      post posts_path, params: { post: { content: "テスト投稿", content2: "テスト投稿", review: 'テスト投稿', actionplan: 'テスト投稿', post_image: 'default_post.jpg', post_document_image: nil } }
    end
    
    def post_invalid_information
      get new_post_path(user)
      post posts_path, params: { post: { content: nil, content2: nil, review: nil, actionplan: nil, post_image: 'default_post.jpg', post_document_image: nil } }
    end
    
    def patch_valid_information
      patch post_path, params: { post: { content: "テスト投稿2", content2: "テスト投稿2" } }
    end
    
    def patch_invalid_information
      patch post_path, params: { post: { content: nil, content2: nil } }
    end
    
    describe '投稿' do
    
    it 'フォームが全て空欄のユーザ投稿が無効' do
      log_in_as(user)
      expect{ post_invalid_information }.not_to change(Post, :count)
    end
    
    it 'ログインしているユーザーの投稿が有効' do
      log_in_as(user)
      expect { post_valid_information }.to change(Post, :count).by(1)
      follow_redirect!
      expect(request.fullpath).to eq '/posts'
    end
    
    it "works! (now write some real specs)" do
      log_in_as(user)
      get user_path(id: 1)
      expect(response).to have_http_status(200)
    end
    
  describe "投稿削除"
    it 'ログインしていないユーザーの投稿削除は無効' do
      delete post_path(1)
      follow_redirect!
      expect(request.fullpath).to eq '/login'
    end
    
    it '他ユーザーの投稿削除は無効' do
      log_in_as(user)
      post_valid_information
      follow_redirect!
      post logout_path
      log_in_as(other_user)
      get user_path(other_user)
      expect(request.fullpath).to eq '/users/2'
      post_valid_information
      expect{ delete post_path(1) }.not_to change(Post, :count)
      expect{ delete post_path(2) }.to change(Post, :count).by(-1)
    end
    
    it 'ログインしているユーザーの投稿削除が有効' do
      log_in_as(user)
      get user_path(user)
      expect{ post_valid_information }.to change(Post, :count).by(1)
      follow_redirect!
      expect{ delete post_path(1) }.to change(Post, :count).by(-1)
      follow_redirect!
      expect(request.fullpath).to eq '/posts'
      expect(flash[:notice]).to be_truthy
    end
    
    describe '投稿編集' do
      it 'ログインしていないユーザーの投稿編集が無効' do
        log_in_as(user)
        get user_path(user)
        post_valid_information
        follow_redirect!
        post logout_path
        follow_redirect!
        get edit_post_path(1)
        follow_redirect!
        expect(request.fullpath).to eq '/login'
      end
      
      it '他ユーザーの投稿編集が無効' do
        log_in_as(user)
        get user_path(user)
        post_valid_information
        follow_redirect!
        post logout_path
        follow_redirect!
        log_in_as(other_user)
        get edit_post_path(1)
        follow_redirect!
        expect(request.fullpath).to eq '/posts'
      end
      
      it 'フォームが全て空欄の投稿編集が無効' do
        log_in_as(user)
        get user_path(user)
        post_valid_information
        follow_redirect!
        get edit_post_path(1)
        expect(request.fullpath).to eq '/posts/1/edit'
        patch_invalid_information
        expect(request.fullpath).to eq '/posts/1'
      end
      
      it 'ログインしているユーザーの投稿編集が有効' do
        log_in_as(user)
        get user_path(user)
        post_valid_information
        follow_redirect!
        get edit_post_path(1)
        expect(request.fullpath).to eq '/posts/1/edit'
        patch_valid_information
        follow_redirect!
        expect(request.fullpath).to eq '/posts/1'
      end
    end
  end
end
