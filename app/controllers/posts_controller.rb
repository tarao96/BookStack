class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  
  
  def index
    @posts = Post.all.paginate(page: params[:page],per_page:5).order(created_at: :desc).search(params[:search])
  end
  
  
  def new
    @post = Post.new
    @post.points.build
  end
  
  def show
    @user = @post.user
    @comment = Comment.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @post.id).count
    @comment = Comment.new
    @comments = @post.comments
    @points = @post.points
  end
  
  
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
     flash[:notice] = "投稿を作成しました"
     redirect_to posts_url
    else
     flash[:notice] = "「タイトル」と「一言要約」を入力してください"
     render :new
    end
  end
    
  
  def edit
  end
  
  def update
   if @post.update(post_params)
    flash[:notice] = "投稿を更新しました"
    redirect_to("/posts/#{@post.id}")
   else
    flash[:notice] = "「タイトル」と「一言要約」を入力してください"
     redirect_to("/posts/#{@post.id}/edit")
   end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_url
  end
  
  private
  
  def set_post
    @post = Post.find_by(id: params[:id])
  end
  
  def post_params
    params.require(:post).permit(:content, :content2, :review, :actionplan, :post_image, :post_document_image,:points_attributes=>[:id, :post_id, :content6, :_destroy])
  end
  
end

