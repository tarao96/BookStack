require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user, id: 1)
    @post = FactoryBot.create(:post, user_id: 1)
    @like = FactoryBot.build(:like, user_id: 1, post_id: 1)
  end
  
  describe 'Like' do
    it 'いいね！ボタンを押下したときにいいね！が有効' do 
      @like.valid?
      expect(@like).to be_valid
    end
  end
  
  describe 'user_id' do
    it 'user_idが空欄の時に無効' do
      @like.user_id = ""
      expect(@like).to be_invalid
    end
  end
  
  describe 'post_id' do
    it 'post_idが空欄の時に無効' do
     @like.post_id = ""
     expect(@like).to be_invalid
   end
 end
end
