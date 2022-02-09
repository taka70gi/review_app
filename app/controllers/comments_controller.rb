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
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:notice] = "投稿しました"
      redirect_to drama_path(@comment.drama)
    else
      flash.now[:alert] = "投稿できませんでした"
      render "new"
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
    @user = current_user
    @comment = Comment.find(params[:id])
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
    redirect_to :users
  end
end

private
def comments_params
  params.require(:comment).permit(:content, :user_id, :drama_id)
end
