class CommentsController < ApplicationController

  before_action :set_prototype

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    @comment = Comment.new(params_comment)
    if @comment.save
      redirect_to action: :index
    else
      @comments = @prototype.comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end


  end



  private
  def params_comment
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
