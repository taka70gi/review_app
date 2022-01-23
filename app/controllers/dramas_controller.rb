class DramasController < ApplicationController
  def index
    @dramas = Drama.all
  end

  def show
    @drama = Drama.find(params[:id])
  end

  def new
    @drama = Drama.all
  end

  def create
    @drama = Drama.new(dramas_params)
    if @drama.save
      flash[:notice] = "ドラマを新規登録しました"
      redirect_to :dramas
    else
      flash.now[:alert] = "ルームを登録できませんでした"
      render new_drama_path
    end
  end

  def edit
    @drama = Drama.find(params[:id])
  end

  def update
    @drama = Drama.find(params[:id])
    if @drama.update(dramas_params)
      flash[:notice] = "ユーザーIDが「#{@drama.id}」の情報を更新しました"
      redirect_to :dramas
    else
      render "edit"
    end
  end

  def destroy
    @drama = Drama.find(params[:id])
    @drama.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :dramas
  end
end

private
def dramas_params
  params.require(:drama).permit(:name, :release_day, :image, :summary, :cast)
end
