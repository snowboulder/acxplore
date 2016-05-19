class GalleriesController < ApplicationController
  before_action :set_activity
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  # before_action :correct_user,   only: [:edit, :update, :index, :destroy]
  before_action :admin_user,     only: [:edit, :update, :index, :destroy]

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = @activity.galleries.find(params[:id])
  end

  def show
  end

  def index
    #@gallery = @activity.galleries.find(params[:id])
    @galleries = @activity.galleries.all
  end

  def create
    # Might need to update gallery_params to require :gallery
    @gallery = Gallery.new(gallery_params)
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
    @gallery = Gallery.find(params[:id])
    # Might need to update gallery_params to require :gallery
    if @gallery.update_attributes(gallery_params)
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
    params.permit(:activity, :picture)
  end

  def original_gallery_params
    params.require(:gallery).permit(:activity_id, :picture)
  end

  def new_gallery_params
    params.fetch(:gallery).permit!
  end

  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
