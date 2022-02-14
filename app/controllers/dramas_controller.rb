class DramasController < ApplicationController
  def index
    @dramas = Drama.all
  end

  def show
    @user = current_user
    @drama = Drama.find(params[:id])
    @users = User.all
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
