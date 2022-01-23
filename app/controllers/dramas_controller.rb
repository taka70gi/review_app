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
