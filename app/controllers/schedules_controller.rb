class SchedulesController < ApplicationController
  def index
    @schedules = Product.all
    render json: @schedules
  end
end
