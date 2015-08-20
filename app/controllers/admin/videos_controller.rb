class Admin::VideosController < ApplicationController
  layout "admin"
  respond_to :html
  before_filter :authenticate_user!
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    respond_with(@videos)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    respond_with(@video)
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    tutorial = Tutorial.find(params[:tutorial_id])
    @video = tutorial.videos.build
    respond_with(@video)
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
  tutorial = Tutorial.find(params[:tutorial_id])
    @video = tutorial.videos.create(params[:video])

    respond_to do |format|
      if @video.save
        format.html { redirect_to [:admin, tutorial], notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    tutorial = Tutorial.find(params[:tutorial_id])
    @video = tutorial.videos.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to [:admin, @video.tutorial, @video], notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to admin_tutorial_videos_url }
      format.json { head :no_content }
    end
  end
end
