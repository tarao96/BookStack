FactoryBot.define do
  factory :post do
    content { 'テストを書く' }
    content2 { 'テスト投稿' }
    user
  end
end