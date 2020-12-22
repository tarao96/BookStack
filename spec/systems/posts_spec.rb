require 'rails_helper'

RSpec.describe Post, type: :system do
  describe '投稿一覧、投稿編集、投稿削除' do
     let(:user) { FactoryBot.create(:user, name: 'test', email: 'test@example.com', image_name: 'default_user.jpg') }
    before do
      FactoryBot.create(:post, content: '最初の投稿', user_id: user.id, post_image: 'default_post.jpg')
      login(user)
    end
    
    context '投稿一覧' do
      it 'testが作成した投稿が投稿一覧に表示される' do
        visit posts_index_path
        expect(page).to have_content '最初の投稿'
        expect(page).to have_selector("img[src$='default_post.jpg']")
      end
    end
    
    context '投稿編集' do
      it '投稿編集が成功する' do
       visit "/posts/1/edit"
       fill_in 'content', with: '編集された投稿'
       click_button '保存'
       expect(current_path).to eq "/posts/1"
       expect(page).to have_content '投稿を更新しました'
       expect(page).to have_content '編集された投稿'
      end
    end
    
    context '投稿編集のタイトルが未入力' do
      it '投稿の編集が失敗する' do
        visit "/posts/1/edit"
        fill_in 'content', with: nil
        click_button '保存'
        expect(current_path).to eq "/posts/1/edit"
        expect(page).to have_content "「タイトル」と「一言要約」を入力してください"
      end
    end
    
    context '投稿の削除' do
      it '投稿の削除が成功する' do
        visit "/posts/1"
        click_on '削除'
        expect(current_path).to eq "/posts/index"
        expect(page).to have_content '投稿を削除しました'
      end
    end
    
  describe '新規投稿' do
    
    before do
       visit posts_new_path
       fill_in 'content', with: '2つ目の投稿'
       fill_in 'content2', with: '2つ目の一言要約'
       click_button '投稿'
     end
     
      context '新規投稿でタイトルを入力したとき' do
      it '新規投稿が成功する' do
        expect(current_path).to eq posts_index_path
        expect(page).to have_content '投稿を作成しました'
        expect(page).to have_content '2つ目の投稿'
        expect(page).to have_content '2つ目の一言要約'
      end
    end
    
      context '投稿一覧でタイトルをクリックしたとき' do
        it '投稿詳細ページが表示される' do
          visit posts_index_path
          click_on '2つ目の投稿'
          expect(current_path).to eq "/posts/2"
          expect(page).to have_content "2つ目の投稿"
          expect(page).to have_content '2つ目の一言要約'
          expect(page).to have_selector("img[src$='default_post.jpg']")
        end
      end
     end
    
  end
end