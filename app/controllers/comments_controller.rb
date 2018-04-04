class CommentsController < ApplicationController

  def create
    Comment.create(params_comment)
    redirect_to controller: :prototypes, action: :show, id: params[:prototype_id]
  end

  private
  def params_comment
    params.permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
