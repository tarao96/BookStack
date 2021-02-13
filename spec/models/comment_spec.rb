require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  let!(:user) { create(:user, id: 1) }
  let!(:post) { create(:post, user_id: 1) }
  let!(:comment) { create(:comment, user_id: 1, post_id: 1) }
  
  describe 'Comment' do
    it 'should be valid' do
      comment.valid?
      expect(comment).to be_valid
    end
  end
  
  describe 'text' do
    it 'gives presence' do
      comment.text = ""
      expect(comment).to be_invalid
    end
  end
  
  describe '141 characters' do
    it 'too long' do
      comment.text = 'a' * 141
      expect(comment).to be_invalid
    end
  end
end
