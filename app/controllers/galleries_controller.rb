class GalleriesController < ApplicationController
  before_action :set_activity

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = @activity.galleries.find(params[:id])
  end

  def show
  end

  def index
    @galleries = @activity.galleries.all
  end

  def create
    # Need gallery params for security, error: ParameterMissing
    @gallery = Gallery.new(gallery_params2)
    if @gallery.save
      params[:galleries]['picture'].each do |a|
        @gallery = @activity.galleries.create!(picture: a, activity_id: @activity_id)
      end
      flash[:success] = "Activity pictures uploaded!"
      redirect_to @activity
    else
      flash[:danger] = "Activity pictures upload failed!"
      redirect_to @activity
    end
  end

  def update
    @gallery = @activity.galleries.find(params[:id])
    # Need gallery params for security, error: ParameterMissing
    if @gallery.update_attributes(gallery_params2)
      flash[:success] = "Activity Gallery updated!"
      redirect_to activity_galleries_path(@activity)
    else
      render 'edit'
    end
  end

  def destroy
    @gallery = @activity.galleries.find(params[:id])
    @gallery.destroy
    flash[:success] = "Activity picture deleted!"
    redirect_to :back
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def gallery_params
    params.require(:gallery).permit(:activity_id, :picture)
  end

  def new_gallery_params
    params.fetch(:gallery).permit!
  end

  def gallery_params2
    params.permit(:picture)
  end

end
