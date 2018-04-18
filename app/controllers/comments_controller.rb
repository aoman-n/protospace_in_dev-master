class CommentsController < ApplicationController

  before_action :set_prototype

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    respond_to do |format|
      format.html
      format.json { @update_comments = Comment.where('id > ?', params[:id]) }
    end
  end

  def create
    @comment = @prototype.comments.new(params_comment)
    @comments = @prototype.comments.includes(:user)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to prototype_comments_path(@prototype) }
        format.json
      end
    else
      redirect_to prototype_comments_path(@prototype)
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:content).merge( user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
