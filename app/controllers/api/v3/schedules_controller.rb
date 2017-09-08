class Api::V3::SchedulesController < ApplicationController
  # before_action :set_poster, only: [:show, :update, :destroy]
  def index
    genre_id = params[:genre_id].to_i
    updated = Time.at(params[:updated_at].to_i).to_s
    if genre_id == 0 then
      @subjects = Subject.all
      @weekperiods = WeekPeriod.all
      @intermediates = Intermediate.all
    elsif genre_id == 1 then
      @subjects = Subject.where(updated_at: updated..Time.now.to_s)
      @weekperiods = WeekPeriod.where(updated_at: updated..Time.now.to_s)
      @intermediates = Intermediate.where(updated_at: updated..Time.now.to_s)
    end
    # 追記した部分
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
