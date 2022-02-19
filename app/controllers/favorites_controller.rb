class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :target_find

  def create
    Favorite.create(user_id: current_user.id, drama_id: params[:drama_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, drama_id: params[:drama_id])
    favorite.destroy
  end

  def target_find
    @drama = Drama.find(params[:drama_id])
  end
end
