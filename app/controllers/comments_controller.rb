class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    binding.pry
    @comment = Comment.new(params.require(:comment).permit(:content, :user_id, :dramaid, { drama_ids: [] }))
    @drama = Drama.find(params[:comment][:dramaid])
    binding.pry
    if @comment.save
      @comment.dramas << @drama
      binding.pry
      flash[:notice] = "新規登録"
      redirect_to :users
    else
      render "comments"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def comments_params
    params.require(:comment).permit(:content, :user_id, :dramaid)
  end


end
