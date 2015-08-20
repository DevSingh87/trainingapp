class Admin::TutorialsController < ApplicationController
  layout "admin"
  respond_to :html
  before_filter :authenticate_user!
  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.order('title').page(params[:page]).per(5)
    respond_with(@tutorials)
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @tutorial = Tutorial.find(params[:id])
    respond_with(@tutorial)
  end

  # GET /tutorials/new
  # GET /tutorials/new.json
  def new
    @tutorial = Tutorial.new
    @tutorial.build_image
	@tutorial.videos.build
    respond_with(@tutorial)
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(params[:tutorial])

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to admin_tutorials_path, notice: 'Tutorial was successfully created.' }
        format.json { render json: @tutorial, status: :created, location: @tutorial }
      else
        format.html { render action: "new" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tutorials/1
  # PUT /tutorials/1.json
  def update
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to [:admin, @tutorial], notice: 'Tutorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to admin_tutorials_url }
      format.json { head :no_content }
    end
  end
end
