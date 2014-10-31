class CommentsController < ApplicationController
  def create
    @idea = Idea.find params[:idea_id]
    @comment = @idea.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to :back, notice: 'You said something'
    else
      redirect_to :back, alert: 'You did not say something'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.user == current_user
      if @comment.destroy
        redirect_to :back, notice: 'Deleted!'
      else
        redirect_to :back, alert: 'Could not delete at this time'
      end
    else
      redirect_to :back, alert: 'Thats not your comment!'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
