class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :destroy, :update]
  before_action :find_ideas, only: [:index]
  before_action :notify_paginate, only: [:index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :updatea]
  before_action :user_permissions_before, only: [:edit, :destroy, :update]
  def index
    @search_term = params[:search]
    @ideas = @ideas.search(@search_term) if params[:search]
    @idea = Idea.new
  end

  def show
    @comment = Comment.new
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to @idea, notice: 'Idea created'
    else
      redirect_to :new, alert: 'Try again'
    end
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to @idea, notice: 'Updated'
    else
      redirect_to :back, alert: 'Try again!'
    end
  end

  def destroy
    if @idea.destroy
      redirect_to ideas_path, notice: 'Idea deleted'
    else
      redirect_to :back, alert: 'Try again!'
    end
  end

  private
  def user_permissions_before
    if @idea.user == current_user
    else
      redirect_to :back, alert: 'Thats not your idea!'
    end
  end

  def notify_paginate
    @render_paginate = true
  end
  def find_idea
    @idea = Idea.find params[:id]
  end
  def idea_params
    params.require(:idea).permit(:title, :description)
  end
  def find_ideas
    @ideas = Idea.all.paginate(page: params[:page], per_page: 10)
  end
end
