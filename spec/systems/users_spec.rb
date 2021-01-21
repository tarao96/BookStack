require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'ユーザー' do
   
      let(:user) { FactoryBot.create(:user, name: 'test', email: 'test@example.com', image_name: 'default_user.jpg') }
    
    describe 'User CRUD' do
      describe 'ログイン前' do
        describe 'ユーザー新規登録' do
    
         context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            #ユーザー新規登録画面へ遷移
            visit new_user_path
            #ユーザー名にtestと入力
            fill_in 'user[name]', with: 'test'
            #メールアドレスにtest@example.comと入力
            fill_in 'user[email]', with: 'test@example.com'
            #パスワードにpasswordと入力
            fill_in 'user[password]', with: 'password'
            #ログインと記述のあるsubmitをクリック
            click_button '新規登録する'
            #users_index_pathに遷移することを期待する
            expect(current_path).to eq "/users/1"
            #遷移されたページに'ユーザー登録が完了しました'の文字列があることを期待する
            expect(page).to have_content 'ユーザー登録が完了しました'
            
            expect(page).to have_content 'test'
          end
        end
            
            context 'メールアドレス未記入' do
              it 'ユーザーの新規登録が失敗' do
                #ユーザー新規登録画面へ遷移
              visit new_user_path
              #ユーザー名にtestと入力
              fill_in 'user[name]', with: 'test'
              #メールアドレスにtest@example.comと入力
              fill_in 'user[email]', with: nil
              #パスワードにpasswordと入力
              fill_in 'user[password]', with: 'password'
              #ログインと記述のあるsubmitをクリック
              click_button '新規登録する'
              #users_index_pathに遷移することを期待する
              expect(current_path).to eq "/users"
              #遷移されたページに'Email can't be blank'の文字列があることを期待する
              
              expect(page).to have_content "Email can't be blank"
              end
            end
            
             context '登録済メールアドレス' do
              it 'ユーザーの新規登録が失敗' do
                #ユーザー新規登録画面へ遷移
              visit new_user_path
              #ユーザー名にtestと入力
              fill_in 'user[name]', with: 'test'
              #メールアドレスにtest@example.comと入力
              fill_in 'user[email]', with: user.email
              #パスワードにpasswordと入力
              fill_in 'user[password]', with: 'password'
              #ログインと記述のあるsubmitをクリック
              click_button '新規登録する'
              #users_index_pathに遷移することを期待する
              expect(current_path).to eq "/users"
              #遷移されたページに'Email has already been taken'の文字列があることを期待する
              
              expect(page).to have_content "Email has already been taken"
              end
            end
            
            describe 'ログイン後' do
              before { login(user) }
              
              context 'ユーザー編集' do
                it 'ユーザーの編集が成功' do
                  visit "/users/1/edit"
                  fill_in 'user[name]', with: 'test'
                  fill_in 'user[email]', with: 'test1@example.com'
                  click_button '更新する'
                  expect(current_path).to eq "/users/1"
                  expect(page).to have_selector("img[src$='default_user.jpg']")
                  expect(page).to have_content 'ユーザー情報を編集しました'
                end
              end
              
              
              
              context 'ログアウト' do
                it 'ログアウトが成功' do
                  click_link 'ログアウト'
                  expect(current_path).to eq "/login"
                  expect(page).to have_content 'ログアウトしました'
                end
              end
            
          end
        end
      end
    end
  end
end
