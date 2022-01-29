class CommentsController < ApplicationController
  def index
    @user = current_user
    @comments = @user.comments
  end

  def new
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:content, :user_id, :drama_id))
    @drama = Drama.find(params[:comment][:drama_id])
    if @comment.save
      flash[:notice] = "新規登録"
      redirect_to drama_path(@drama)
    else
      render "comments"
    end
  end

  def show
    @user = current_user
    @comment = Comment.new
    @drama = Drama.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :users
  end
  private
  def comments_params
    params.require(:comment).permit(:content, :user_id, :drama_id)
  end


end
