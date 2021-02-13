require 'rails_helper'

RSpec.describe "Follows", type: :request do
  
  let(:user4) { create(:user4, id: 1) }
  let(:other_user4) { create(:other_user4, id: 2) }
  
  def follow_create_information
    post user_relationships_path(user_id: 1), params: { user_id: 1 }
  end
  
  def follow_delete_information
    delete user_relationship_path(id: 1, user_id: 1), params: { user_id: 1 }
  end
  
  describe "フォロー" do
    it 'ログインしているユーザーのフォローが有効' do
      log_in_as(user4)
      expect{ follow_create_information }.to change(Relationship, :count).by(1)
      follow_redirect!
      expect(request.fullpath).to eq '/users'
    end
    
    it 'ログインしていないユーザーのフォローが無効' do
      follow_create_information
      follow_redirect!
      expect(request.fullpath).to eq '/login'
    end
    
    it 'ログインしているユーザーのフォロー解除が有効' do
      log_in_as(user4)
      expect{ follow_create_information }.to change(Relationship, :count).by(1)
      follow_redirect!
      expect{ follow_delete_information }.to change(Relationship, :count).by(-1)
      follow_redirect!
      expect(request.fullpath).to eq '/users'
    end
    
    it 'ログインしていないユーザーのフォロー解除が無効' do
      log_in_as(user4)
      follow_create_information
      follow_redirect!
      post logout_path
      follow_redirect!
      follow_delete_information
      follow_redirect!
      expect(request.fullpath).to eq '/login'
    end  
    
  end
end
