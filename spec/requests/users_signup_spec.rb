require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /signup" do
    it 'ユーザーの新規登録に失敗' do
      get new_user_path
      expect {
        post users_path, params: {
          user: {
            name: "",
            email: "test@invalid",
            password: "password"
          }
        }
      }.not_to change(User, :count)
    end
    
    it 'ユーザの新規登録に成功' do
      get new_user_path
      expect {
      post users_path, params: {
          name: "exampleuser",
          email: "user@example.com",
          password: "example"
        }
      }.to change(User, :count).by(1)
    end
  end
end