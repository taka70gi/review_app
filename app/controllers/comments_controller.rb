class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @comments = Comment.all
  end

  def new
    @user = current_user
    @comment = Comment.new
    @drama = Drama.find(params[:id])
  end

  def create
    @user = current_user
    @comment = Comment.new(comments_params)
    @drama = @comment.drama
    if @comment.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to drama_path(@drama)
    else
      flash[:alert] = "レビューを投稿できませんでした"
      render "edit"
    end
  end

  def edit
    @user = current_user
    @comment = Comment.find(params[:id])
    @drama = @comment.drama
  end

  def update
    @user = current_user
    @comment = Comment.find(params[:id])
    @drama = @comment.drama
    if @comment.update(comments_params)
      flash[:notice] = "レビューを更新しました"
      redirect_to users_path
    else
      flash[:alert] = "レビューを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "レビューを削除しました"
    if current_user.admin?
      redirect_to comments_path
    else
      redirect_to :users
    end

  end
end

private
def comments_params
  params.require(:comment).permit(:content, :user_id, :drama_id)
end
