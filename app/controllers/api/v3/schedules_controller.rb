class Api::V3::SchedulesController < ApplicationController
  # before_action :set_poster, only: [:show, :update, :destroy]
  def index
    genre_id = params[:genre_id].to_i
    # ここでupdated_atをdatetime型に修正する
    if genre_id == 0 then
      @subjects = Subject.all
      @weekperiods = WeekPeriod.all
      @intermediates = Intermediate.all
    elsif genre_id == 1 then
      @subjects = Subject.all
      @weekperiods = WeekPeriod.all
      @intermediates = Intermediate.all
    end
    # 追記した部分
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
