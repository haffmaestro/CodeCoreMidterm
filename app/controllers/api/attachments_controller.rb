class Api::AttachmentsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @idea.attachment = params[:file]
    if @idea.save!
      render json: {saved: true}
    else
      render json: {saved: false}
    end
  end
end