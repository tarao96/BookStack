require 'rails_helper'

RSpec.describe 'SiteLayouts', type: :system do
  describe "home layout" do
    it 'contains root link' do
      visit root_path
      expect(page).to have_link "BookStack", href: root_path
    end
    
    it 'contains login link' do
      visit root_path
      expect(page).to have_link 'ログイン', href: login_path
    end
    
    it 'contains signup link' do
      visit root_path
      expect(page).to have_link '新規登録', href: signup_path
    end
  end
  
  describe "ログイン後" do
    let(:user) { FactoryBot.create(:user, name: 'test', email: 'test@example.com', image_name: 'default_user.jpg', id: 1) }
    before do
      login(user)
      visit root_path
    end
    
    it 'contains user_name link' do
      expect(page).to have_link 'test', href: "/users/1"
    end
    
    it 'contains posts_index link' do
      expect(page).to have_link '投稿一覧', href: posts_index_path
    end
    
    it 'contains posts_new link' do
      expect(page).to have_link '新規投稿', href: posts_new_path
    end
    
    it 'contains users_index link' do
      expect(page).to have_link 'ユーザー一覧', href: "/users/index"
    end
    
    it 'contains logout link' do
      expect(page).to have_link 'ログアウト', href: "/logout"
    end
  end
end