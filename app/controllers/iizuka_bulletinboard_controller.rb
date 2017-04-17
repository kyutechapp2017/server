class IizukaBulletinboardController < ApplicationController
  def index
    @schedules = IizukaNotice.all
    render json: @schedules
  end

  def update_at_1
    @schedules = IizukaNotice.all
    render json: @schedules
  end

  def update_at_2
    @schedules = IizukaLecture.all
    render json: @schedules
  end

  def update_at_3
    @schedules = IizukaCall.all
    render json: @schedules
  end

  def update_at_4
    @schedules = IizukaIntensiveLecture.all
    render json: @schedules
  end

  def update_at_5
    @schedules = IizukaStudyingAbroad.all
    render json: @schedules
  end

  def update_at_6
    @schedules = IizukaScholarship.all
    render json: @schedules
  end

  def update_at_7
    @schedules = IizukaOther.all
    render json: @schedules
  end

  def update_at_8
    @schedules = IizukaHomepage.all
    render json: @schedules
  end
end
