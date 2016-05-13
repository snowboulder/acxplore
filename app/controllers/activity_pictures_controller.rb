class ActivityPicturesController < ApplicationController
  before_action :set_activity_picture, only: [:show, :edit, :update, :destroy]

  # GET /activity_pictures
  # GET /activity_pictures.json
  def index
    @activity_pictures = ActivityPicture.all
  end

  # GET /activity_pictures/1
  # GET /activity_pictures/1.json
  def show
  end

  # GET /activity_pictures/new
  def new
    @activity_picture = ActivityPicture.new
  end

  # GET /activity_pictures/1/edit
  def edit
  end

  # POST /activity_pictures
  # POST /activity_pictures.json
  def create
    @activity_picture = ActivityPicture.new(activity_picture_params)

    respond_to do |format|
      if @activity_picture.save
        format.html { redirect_to @activity_picture, notice: 'Activity picture was successfully created.' }
        format.json { render :show, status: :created, location: @activity_picture }
      else
        format.html { render :new }
        format.json { render json: @activity_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_pictures/1
  # PATCH/PUT /activity_pictures/1.json
  def update
    respond_to do |format|
      if @activity_picture.update(activity_picture_params)
        format.html { redirect_to @activity_picture, notice: 'Activity picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_picture }
      else
        format.html { render :edit }
        format.json { render json: @activity_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_pictures/1
  # DELETE /activity_pictures/1.json
  def destroy
    @activity_picture.destroy
    respond_to do |format|
      format.html { redirect_to activity_pictures_url, notice: 'Activity picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_picture
      @activity_picture = ActivityPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_picture_params
      params.require(:activity_picture).permit(:activity_id, :picture)
    end
end
