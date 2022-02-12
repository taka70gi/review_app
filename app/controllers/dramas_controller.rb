class DramasController < ApplicationController
  def index
    @dramas = Drama.all
  end

  def show
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
