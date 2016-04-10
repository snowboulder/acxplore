class ActivitiesController < ApplicationController

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

  private

  def activity_params
    params.require(:activity).permit(:name, :group, :description, :subgroup,
                                     :range, :duration, :environment, :season,
                                     :min_people, :max_people)
  end

end
