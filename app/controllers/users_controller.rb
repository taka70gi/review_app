class UsersController < ApplicationController
  def index
    @user = current_user
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
    binding.pry
    if @user.update(params.require(:user).permit(:name, :profile, :image))
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
  end
end
