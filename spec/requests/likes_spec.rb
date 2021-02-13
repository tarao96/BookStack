require 'rails_helper'

RSpec.describe "Likes", type: :request do
  
  let!(:user3) { create(:user3) }
  let!(:post3) { create(:post3) }
  
  def like_valid_information
    post post_likes_path(post_id: 1), xhr: true, params: { post_id: 1 }
  end
  
  describe "いいね！" do
    it 'ログインしているユーザーのいいね！が有効' do
      log_in_as(user3)
      expect{ post post_likes_path(post_id: 1), xhr: true }.to change(Like, :count).by(1)
      expect(request.fullpath).to eq '/posts/1/likes'
    end
    
    it 'ログインしているユーザーのいいね！解除が有効' do
      log_in_as(user3)
      like_valid_information
      expect{ delete post_like_path(id: 1, post_id: 1), xhr: true }.to change(Like, :count).by(-1)
    end
    
  end
end
