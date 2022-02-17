class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @drama = Drama.find(params[:drama_id])
    like = @comment.likes.new(user_id: current_user.id)
    if like.save
      flash[:notice] = "いいね登録しました"
      redirect_to drama_path(@drama)
    else
      redirect_to drama_path(@drama)
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @drama = Drama.find(params[:drama_id])
    like = @comment.likes.find_by(user_id: current_user.id)
    if like.present?
      flash[:notice] = "いいね解除しました"
      like.destroy
      redirect_to drama_path(@drama)
    else
      redirect_to drama_path(@drama)
    end
  end
end
