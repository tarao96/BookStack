require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(
    content: "最初の投稿",
    content2: "最初の要約",
    post_image: "default_post.jpg",
    user_id: 1
    )}
    
  describe 'Post' do
    it 'should be valid' do
      expect(post).to be_valid
    end
  end
  
  describe 'content' do
    it 'gives presence' do
      post.content = ""
      expect(post).to be_invalid
    end
  end
  
  describe 'content2' do
    it 'gives presence' do
      post.content2 = ""
      expect(post).to be_invalid
    end
  end
  
  describe 'user_id' do
    it 'gives presence' do
      post.user_id = ""
      expect(post).to be_invalid
    end
  end
end