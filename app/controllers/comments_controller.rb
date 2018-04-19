class CommentsController < ApplicationController

  before_action :set_prototype, :like_count

  def index
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def like
    @like = Like.new(like_params)
    if @like.save
      # ajax here after, this is tmp

      # updating like count for prototype table
      like_count
      Prototype.find(params[:prototype_id]).update(like: @count)
      @like_count
      respond_to do |format|
        format.html {redirect_to prototype_comments_path(@prototype)}
        format.json
      end
      # flash[:notice] = "You liked!"
      # redirect_to action: "index"
    else
      redirect_to action: "index"
    end
  end

  def like_count
    @count = Like.where(prototype_id: params[:prototype_id]).count
  end

  def create
    @comment = @prototype.comments.new(params_comment)
    if @comment.save
      redirect_to prototype_comments_path(@prototype), notice: 'メッセージを投稿しました'
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

  def like_params
    params.permit(:user_id, :prototype_id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
