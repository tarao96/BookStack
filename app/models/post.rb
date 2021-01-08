class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :content, {presence: true}
  validates :content2, {presence: true}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
  def self.search(search)
    if search
      Post.where('content LIKE ?',"%#{search}%")
    else
      Post.all
    end
  end
  
 
end
