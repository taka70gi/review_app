class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @comments = @user.comments
  end

  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:notice] = "投稿しました"
      redirect_to drama_path(@comment.drama)
    else
      flash.now[:alert] = "投稿できませんでした"
      render drama_path(@comment)
    end
  end

  def show
    @user = current_user
    @comment = Comment.new
  end

  def edit
    @user = current_user
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      flash[:notice] = "コメントを更新しました"
      redirect_to users_path
    else
      flash[:alert] = "コメントを更新できませんでした"
      render users_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to :users
  end
end

private
def comments_params
  params.require(:comment).permit(:content, :user_id, :drama_id)
end
