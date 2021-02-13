FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password' }
  end
  
  factory :other_user, class: User do
    name { '他テストユーザー' }
    email { 'test2@example.com' }
    password{ 'foobar' }
  end
  
  factory :user2, class: User do
    name { 'テストユーザー2' }
    email { 'palewaves@example.com' }
    password { 'password2' }
  end
  
  factory :other_user2, class: User do
    name { '他テストユーザー2' }
    email { 'test3@example.com' }
    password{ 'foobar2' }
  end
  
  factory :user3, class: User do
    name { 'テストユーザー3' }
    email { 'test4@example.com' }
    password { 'password3' }
  end
  
  factory :other_user3, class: User do
    name { '他テストユーザー3' }
    email { 'test5@example.com' }
    password{ 'foobar3' }
  end
  
  factory :user4, class: User do
    name { 'テストユーザー4' }
    email { 'test6@example.com' }
    password { 'password4' }
  end
  
  factory :other_user4, class: User do
    name { '他テストユーザー4' }
    email { 'test7@example.com' }
    password{ 'foobar4' }
  end
  
  factory :user5, class: User do
    name { 'テストユーザー5' }
    email { 'test8@example.com' }
    password { 'password5' }
  end
  
end