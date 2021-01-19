class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :points, dependent: :destroy
  accepts_nested_attributes_for :points, allow_destroy: true
  
  mount_uploader :post_image, PostImageUploader
  mount_uploader :post_document_image, PostDocumentImageUploader
  validates :content, presence: true
  validates :content2, presence: true
  validates :user_id, presence: true
  
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
