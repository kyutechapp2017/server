class SchedulesController < ApplicationController
  def index
    @schedules = Subject.all
    render json: @schedules
  end

  def update_at
    @schedules = Subject.all
    render json: @schedules
  end
end
