class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule= Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    Schedule.create(schedule_parameter)
    redirect_to schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_parameter)
      redirect_to schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :content, :start_time, :image)
  end

end
