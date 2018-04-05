class CommentsController < ApplicationController

  before_action :set_prototype

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    Comment.create(params_comment)
    redirect_to action: :index
  end

  private
  def params_comment
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
