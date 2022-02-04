class DramasController < ApplicationController
  def index
    @dramas = Drama.all
  end

  def show
    @drama = Drama.find(params[:id])
    @users = User.all
  end

  def new
    @drama = Drama.new
  end

  def create
    @drama = Drama.new(dramas_params)
    if @drama.save
      flash[:notice] = "ドラマを登録しました"
      redirect_to :dramas
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
      redirect_to :dramas
    else
      flash.now[:alert] = "ドラマ登録内容を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @drama = Drama.find(params[:id])
    @drama.destroy
    flash[:notice] = "ドラマを削除しました"
    redirect_to :dramas
  end

  def search
    if params[:keyword].present?
      @dramas = Drama.search(params[:keyword])
      @key = params[:keyword]
    else
      @dramas = Drama.all
    end
  end
end

private
def dramas_params
  params.require(:drama).permit(:name, :release_day, :image, :summary, :cast)
end
