class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorite = Favorite.create(user_id: current_user.id, drama_id: @drama.id)
  end

  def create
    @drama = Drama.find(params[:drama_id])
    favorite = @drama.favorites.new(user_id: current_user.id)
    if favorite.save
      flash[:notice] = "お気に入り登録しました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @drama = Drama.find(params[:drama_id])
    favorite = @drama.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      flash[:notice] = "お気に入り解除しました"
      favorite.destroy
      redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end

private
def set_post
  @drama = Drama.find(params[:drama_id])
end
