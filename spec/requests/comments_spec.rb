require 'rails_helper'

RSpec.describe "Comments", type: :request do
  
  let!(:user2) { create(:user2) }
  let!(:other_user2) { create(:other_user2) }
  let!(:post2) { create(:post2) }
  
  def comment_valid_information
    post post_comments_path(post_id: 1), params: { comment: { text: 'テストコメント' }  }
  end
  
  def comment_invalid_information
    post post_comments_path(post_id: 1), params: { comment: { text: nil } }
  end
  
  describe "コメント投稿" do
    it 'フォームが全て空欄のコメント投稿が無効' do
      log_in_as(user2)
      expect{ comment_invalid_information }.not_to change(Comment, :count)
    end
    
    it 'ログインしているユーザーのコメントが有効' do
      log_in_as(user2)
      expect{ comment_valid_information }.to change(Comment, :count).by(1)
    end
    
    it 'ログインしていないユーザーのコメント投稿が無効' do
      comment_valid_information
      follow_redirect!
      expect(request.fullpath).to eq '/login'
    end
    
    it 'コメントしていないユーザーのコメント削除が無効' do
      log_in_as(user2)
      comment_valid_information
      follow_redirect!
      post logout_path
      log_in_as(other_user2)
      get user_path(other_user2)
      expect(request.fullpath).to eq '/users/2'
      comment_valid_information
      expect{ delete post_comment_path(id: 1, post_id: 1) }.not_to change(Comment, :count)
      expect{ delete post_comment_path(id: 2, post_id: 1) }.to change(Comment, :count).from(2).to(1)
    end
    
    it 'ログインしているユーザーがコメントした投稿の削除が有効' do
      log_in_as(user2)
      expect{ comment_valid_information }.to change(Comment, :count).by(1)
      follow_redirect!
      expect{ delete post_comment_path(id: 1, post_id: 1) }.to change(Comment, :count).by(-1)
      follow_redirect!
      expect(request.fullpath).to eq "/posts/1"
      expect(flash[:notice]).to be_truthy
    end
  end
end
