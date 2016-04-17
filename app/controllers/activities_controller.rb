class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  # before_action :correct_user,   only: [:edit, :update, :index, :destroy]
  before_action :admin_user,     only: [:edit, :update, :index, :destroy]

  def index
    @activities = Activity.paginate(page: params[:page])
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:success] = "New Activity (#{@activity.name}) created!"
      redirect_to @activity
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Activity updated!"
      redirect_to @activity
    else
      render 'edit'
    end
  end

  def destroy
    Activity.find(params[:id]).destroy
    flash[:success] = "Activity deleted"
    redirect_to activities_url
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :group, :description, :subgroup,
                                     :range, :duration, :environment, :season,
                                     :min_people, :max_people, :picture)
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
