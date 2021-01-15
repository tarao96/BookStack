class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(text_params)
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
    redirect_to post_url
  end
  
  private
  
  def text_params
    params.require(:comment).permit(:text)
  end
end
