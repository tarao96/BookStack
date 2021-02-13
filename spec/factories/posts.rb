FactoryBot.define do
  factory :post do
    content { 'テストを書く' }
    content2 { 'テスト投稿' }
    association :user
  end
  
  factory :post2, class: Post do
    content { 'テストを書く2' }
    content2 { 'テスト投稿2' }
    association :user
  end
  
  factory :post3, class: Post do
    content { 'テストを書く3' }
    content2 { 'テスト投稿3' }
    association :user
  end
  
  factory :post4, class: Post do
    content { 'テストを書く4' }
    content2 { 'テスト投稿4' }
    association :user
  end
  
end