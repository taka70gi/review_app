class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @drama = Drama.find(params[:drama_id])
    favorite = @drama.favorites.new(user_id: current_user.id)
    if favorite.save
      flash[:notice] = "お気に入り登録しました"
      redirect_to drama_path(@drama)
    else
      redirect_to drama_path(@drama)
    end
  end

  def destroy
    @drama = Drama.find(params[:drama_id])
    favorite = @drama.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      flash[:notice] = "お気に入り解除しました"
      favorite.destroy
      redirect_to drama_path(@drama)
    else
      redirect_to drama_path(@drama)
    end
  end
end
