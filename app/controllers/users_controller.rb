class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @favorites = Favorite.where(user_id: current_user.id)
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(users_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "プロフィールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to users_path
  end
end
private
def users_params
  params.require(:user).permit(:name, :profile, :image)
end
