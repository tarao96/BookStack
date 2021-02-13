require 'rails_helper'

RSpec.describe Relationship, type: :system do
  describe 'フォローする、フォローされる' do
    
    
    before do
      FactoryBot.create(:user, name: 'test3', email: 'test3@example.com', password: 'password', image_name: 'default_user.jpg')
      FactoryBot.create(:user, name: 'test4', email: 'test4@example.com', password: 'password', image_name: 'default_user.jpg')
      FactoryBot.create(:relationship, following_id: 1, follower_id: 2)
    end
    
    context 'フォローする' do
      it 'フォローしているユーザーが表示される' do
        visit "/login"
        fill_in 'email', with: 'test3@example.com'
        fill_in 'password', with: 'password'
        click_button 'ログイン'
        visit follows_user_path(id: 1)
        expect(current_path).to eq follows_user_path(id: 1)
        expect(page).to have_content 'test4'
        expect(page).to have_content 'フォロー済み'
      end
    end
    
    context 'フォローされる' do
      it 'フォローされた後にユーザページのフォロワーに表示される' do
        visit "/login"
        fill_in 'email', with: 'test4@example.com'
        fill_in 'password', with: 'password'
        click_button 'ログイン'
        visit followers_user_path(id: 2)
        expect(current_path).to eq followers_user_path(id: 2)
        expect(page).to have_content 'test3'
        expect(page).to have_content 'フォローする'
      end
    end
  end
end