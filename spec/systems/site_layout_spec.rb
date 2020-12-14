require 'rails_helper'

RSpec.describe "本要約機能", type: :system do  
  describe "要約投稿機能" do
    before do 
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'a')
      FactoryBot.create(:post, name: '嫌われる勇気', user: user_a)
    end
    
    context "ユーザーAがログインしているとき" do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'a'
        click_button 'ログイン'
      end

    it "ユーザーAが作成した投稿が表示される" do
      expect(page).to have_content '嫌われる勇気'
    end
  end
end
end