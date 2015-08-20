class LecturesController < ApplicationController
  respond_to :html
  # GET /tutorials
  # GET /tutorials.json
  def index
   redirect_to root_path
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @tutorial = Tutorial.find(params[:id])
	  @videos = @tutorial.videos.all
    
  end
  
end
