class UsersController < ApplicationController
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: current_user.id)
    @comments = @user.comments
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(users_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to :users
    else
      flash.now[:alert] = "プロフィールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
  end
end
private
def users_params
  params.require(:user).permit(:name, :profile, :image)
end
