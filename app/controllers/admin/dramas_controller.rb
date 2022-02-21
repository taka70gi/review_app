class Admin::DramasController < ApplicationController
  before_action :if_not_admin

  def index
    @dramas = Drama.all
  end

  def new
    @drama = Drama.new
  end

  def create
    @drama = Drama.new(dramas_params)
    if @drama.save
      flash[:notice] = "ドラマを登録しました"
      redirect_to admin_dramas_path
    else
      flash.now[:alert] = "ドラマを登録できませんでした"
      render "new"
    end
  end

  def edit
    @drama = Drama.find(params[:id])
  end

  def update
    @drama = Drama.find(params[:id])
    if @drama.update(dramas_params)
      flash[:notice] = "ドラマ登録内容を更新しました"
      redirect_to admin_dramas_path
    else
      flash.now[:alert] = "ドラマ登録内容を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @drama = Drama.find(params[:id])
    @drama.destroy
    flash[:notice] = "ドラマを削除しました"
    redirect_to admin_dramas_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end

private

def dramas_params
  params.require(:drama).permit(:name, :release_day, :image, :summary, :cast)
end
