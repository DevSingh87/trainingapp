class VideotutsController < ApplicationController
  impressionist actions: [:index, :show]
  respond_to :html
  # GET /videos
  # GET /videos.json
  def index
    @lecture = Tutorial.find(params[:lecture_id])
    @videotuts = @lecture.videos.order(:id)
    
   
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    lecture = Tutorial.find(params[:lecture_id])
	  @videotuts = lecture.videos.order(:id)
    @videotut = lecture.videos.find(params[:id])
	  impressionist(@videotut)
  end

end
