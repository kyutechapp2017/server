class Api::V3::BulletInBoardsController < ApplicationController
  def index
    genre_id = params[:genre_id].to_i
    updated_at = Time.at(params[:updated_at])
    if genre_id == 0 then
      @iizukanotices = IizukaNotice.all
      @iizukalectures = IizukaLecture.all
      @iizukacalls = IizukaCall.all
      @iizukaintensivelectures = IizukaIntensiveLecture.all
      @iizukastudyingabroads = IizukaStudyingAbroad.all
      @iizukascholarships = IizukaScholarship.all
      @iizukaothers = IizukaOther.all
      @iizukahomepages = IizukaHomepage.all
    elsif genre_id == 1 then
      @iizukanotices = IizukaNotice.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==2 then
      @iizukalectures = IizukaLecture.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==3 then
      @iizukacalls = IizukaCall.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==4 then
      @iizukaintensivelectures = IizukaIntensiveLecture.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==5 then
      @iizukastudyingabroads = IizukaStudyingAbroad.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==6 then
      @iizukascholarships = IizukaScholarship.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==7 then
      @iizukaothers = IizukaOther.where(updated_at: updated..Time.now.to_s)
    elsif genre_id ==8 then
      @iizukahomepages = IizukaHomepage.where(updated_at: updated..Time.now.to_s)
    end
  end
end
