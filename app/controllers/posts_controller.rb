class PostsController < ApplicationController
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
      actionplan: params[:actionplan],
      user_id: @current_user.id,
      post_image: "default_post.jpg"
      )
    if @post.save
     if params[:image_book]
      @post.post_image = "#{@post.id}.jpg"
      image_book = params[:image_book]
      File.binwrite("public/post_images/#{@post.post_image}",image_book.read)
     end
     
     if params[:document_image]
       @post.post_document_image = "#{@post.id}.jpg"
       document_image = params[:document_image]
       File.binwrite("public/post_document_images/#{@post.post_document_image}",document_image.read)
     end
       
     @post.save
     flash[:notice] = "投稿を作成しました"
     redirect_to("/posts/index")
    else
     flash[:notice] = "「タイトル」と「一言要約」を入力してください"
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
    @post.actionplan = params[:actionplan]
  if @post.save
    if params[:image_book]
      @post.post_image = "#{@post.id}.jpg"
      image_book = params[:image_book]
      File.binwrite("public/post_images/#{@post.post_image}",image_book.read)
    end
    @post.save
    flash[:notice] = "投稿を更新しました"
    redirect_to("/posts/#{@post.id}")
  else
    flash[:notice] = "「タイトル」と「一言要約」を入力してください"
     redirect_to("/posts/#{@post.id}/edit")
  end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  

end
