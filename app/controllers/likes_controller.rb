class LikesController < ApplicationController
  before_action :find_idea

  def create
    if @idea.likes_for(current_user) == nil && @idea.user != current_user
      @like = @idea.likes.new
      @like.user = current_user
      if @like.save
        redirect_to :back, notice: 'Liked!'
      else
        redirect_to :back, alert: 'Couldnt like at this time'
      end
    else
      redirect_to :back, alert: "You've already liked this, or you are the creator!"
    end
  end

  def destroy
    @like = like.find params[:id]
    if @like.destroy
      redirect_to :back, notice: 'Unliked'
    else
      redirect_to :back, alert: 'Sorry you cannot unlike this idea at this time'
    end
  end

  private
  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
