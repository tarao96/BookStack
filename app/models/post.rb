class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments
  
  validates :content, {presence: true}
  validates :content2, {presence: true}
  validates :user_id, {presence: true}
  
  
  def self.search(search)
    if search
      Post.where('content LIKE ?',"%#{search}%")
    else
      Post.all
    end
  end
  
 
end
