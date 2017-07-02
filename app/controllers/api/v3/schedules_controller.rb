class Api::V3::SchedulesController < ApplicationController
  # before_action :set_poster, only: [:show, :update, :destroy]
  def index
    @subjects = Subject.all
    @weekperiods = WeekPeriod.all
    @intermediates = Intermediate.all

    # 追記した部分
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
