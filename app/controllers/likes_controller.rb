class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :target_find

  def create
    Like.create(user_id: current_user.id, comment_id: params[:comment_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    like.destroy
  end

  def target_find
    @drama = Drama.find(params[:dramaid])
    @comment = Comment.find(params[:comment_id])
  end
end
