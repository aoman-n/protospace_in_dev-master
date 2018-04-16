class CommentsController < ApplicationController

  before_action :set_prototype

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    @comment = @prototype.comments.new(params_comment)
    if @comment.save
      # redirect_to prototype_comments_path(@prototype), notice: 'メッセージを投稿しました'
      respond_to do |format|
        format.html { redirect_to prototype_comments_path(@prototype) }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください'
      @comments = @prototype.comments.includes(:user)
      render :index
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
