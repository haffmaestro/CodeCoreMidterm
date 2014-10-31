class JoinsController < ApplicationController
  before_action :find_idea

  def create
    if @idea.joins_for(current_user) == nil && @idea.user != current_user
      @join = @idea.joins.new
      @join.user = current_user
      if @join.save
        redirect_to :back, notice: 'Joined!'
      else
        redirect_to :back, alert: 'Couldnt join at this time'
      end
    else
      redirect_to :back, alert: "You've already joined this, or you are the creator!"
    end
  end

  def destroy
    @join = Join.find params[:id]
    if @join.destroy
      redirect_to :back, notice: 'Left!'
    else
      redirect_to :back, alert: 'Sorry you cannot leave this idea at this time'
    end
  end

  private
  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
