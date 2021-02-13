class CommentsController < ApplicationController
   before_action :authenticate_user
   before_action :ensure_correct_post, {only: [:destroy]} 
   
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text_params)
    @comment.user_id = @current_user.id
    @comment.user_image_name = @current_user.image_name
    if @comment.save
      flash[:notice] = "コメントしました。"
      redirect_to "/posts/#{@post.id}"
    else 
      flash[:notice] = "コメントできません。"
      redirect_to  "/posts/#{@post.id}"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to "/posts/#{@post.id}"
  end
  
  private
  
  def ensure_correct_post
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end
  
  def text_params
    params.require(:comment).permit(:text)
  end
end
