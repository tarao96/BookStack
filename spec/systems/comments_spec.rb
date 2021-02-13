require 'rails_helper'

RSpec.describe Comment, type: :system do
  describe 'コメント投稿、コメント表示' do
  
  before do
     FactoryBot.create(:user, name: 'test5', email: 'test5@example.com', image_name: 'default_user.jpg', password: 'password')
     FactoryBot.create(:post, content: 'テスト投稿', content2: 'テスト')
     FactoryBot.create(:comment, text: 'テストコメント', user_id: 1, post_id: 1)
     visit "/login"
     fill_in 'email', with: 'test5@example.com'
     fill_in 'password', with: 'password'
     click_button 'ログイン'
     visit post_path(id: 1)
  end
  
  context 'コメント投稿' do
    it 'コメント投稿が成功する' do
      fill_in 'comment[text]', with: 'テストコメント2'
      click_on 'コメントする'
      expect(current_path).to eq "/posts/1"
      expect(page).to have_content "コメントしました。"
      expect(page).to have_content "テストコメント2"
    end
    
    it '文字数オーバーでコメント投稿が失敗する' do
      fill_in 'comment[text]', with: 'テストコメント' * 100
      click_on 'コメントする'
      expect(current_path).to eq "/posts/1"
      expect(page).to have_content "コメントできません。"
    end
    
    it '入力が空欄でコメント投稿が失敗する' do
      fill_in 'comment[text]', with: ''
      click_on 'コメントする'
      expect(current_path).to eq "/posts/1"
      expect(page).to have_content "コメントできません。"
    end
  end
    
    context 'コメントの削除' do
     it 'コメントの削除が成功する' do
      click_on 'コメント削除'
      expect(current_path).to eq "/posts/1"
      expect(page).to have_content "コメントを削除しました。"
     end
    end
  end
end