class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true
  
  mount_uploader :image_name, ImageNameUploader
 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  
  # ========自分がフォローしているユーザーとの関連 =========== #
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので、親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「following」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================== #
  
   # ========自分がフォローされるユーザーとの関連 =========== #
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので、親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  #中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # ========================================================== #
  
  def followed_by?(user)
    #ユーザーがfollow済みかどうかを判定
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

  
  def posts
    return Post.where(user_id: self.id).order(created_at: :desc)
  end
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
end
