require 'rails_helper'

RSpec.describe "UsersLogin", type: :request do
  describe "GET /login" do
    it '無効なログイン情報でエラーメッセージが出る' do
      get login_path
      post login_path, params: {
        email: "",
        password: ""
      }
      expect(response.body).to include 'メールアドレスまたはパスワードが間違っています'
    end
    
    it 'ログインが問題なく実行される' do
      get login_path
      post login_path, params: {
        email: "user@example.com",
        password: "password"
      }
      expect(@error_message).to be_falsey
    end
    
    it 'ログアウトが問題なく実行される' do
      get user_path(id: 1)
      post logout_path
      expect(flash[:notice]).to be_truthy
    end
  end
end