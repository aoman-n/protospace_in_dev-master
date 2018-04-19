class CommentsController < ApplicationController

  before_action :set_prototype, :like_count

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    respond_to do |format|
      format.html
      format.json { @update_comments = Comment.where('id > ?', params[:id]) }
    end
  end

  def like
    @like = Like.new(like_params)
    if @like.save
      like_count
      Prototype.find(params[:prototype_id]).update(like: @count)
      @like_count
      respond_to do |format|
        format.html {redirect_to prototype_comments_path(@prototype)}
        format.json
      end
    else
      redirect_to action: "index"
    end
  end

  def like_count
    @count = Like.where(prototype_id: params[:prototype_id]).count
    @liked_user_array = Like.where(prototype_id: params[:prototype_id]).pluck(:user_id)
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

  def like_params
    params.permit(:user_id, :prototype_id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
