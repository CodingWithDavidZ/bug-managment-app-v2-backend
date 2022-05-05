class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :authorize

  # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # POST /bugs/:bug_id/comments
  def addComment
    bug_id = params[:bug_id]
    comment_text = params[:comment_text]
    user_id = @current_user.id
    comment =
      Comment.new(
        bug_id: bug_id,
        comment_text: comment_text,
        created_by: user_id
      )
    if comment.save
      render json: Bug.find(bug_id), status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:comment_text, :created_by, :bug_id)
  end
end
