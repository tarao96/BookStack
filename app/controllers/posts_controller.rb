class PostsController < ApplicationController
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
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def create
    @post = Post.new(
      content: params[:content],
      content2: params[:content2],
      content3: params[:content3],
      content4: params[:content4],
      content5: params[:content5],
      review: params[:review],
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.content2 = params[:content2]
    @post.content3 = params[:content3]
    @post.content4 = params[:content4]
    @post.content5 = params[:content5]
    @post.review = params[:review]
    @post.save
    
    redirect_to("/posts/#{@post.id}")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
