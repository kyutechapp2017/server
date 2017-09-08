class Api::V3::BulletInBoardsController < ApplicationController
  def index
    genre_id = params[:genre_id].to_i
    # ここでupdated_atをdatetime型に修正する
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
      @iizukanotices = IizukaNotice.all
    elsif genre_id ==2 then
      @iizukalectures = IizukaLecture.all
    elsif genre_id ==3 then
      @iizukacalls = IizukaCall.all
    elsif genre_id ==4 then
      @iizukaintensivelectures = IizukaIntensiveLecture.all
    elsif genre_id ==5 then
      @iizukastudyingabroads = IizukaStudyingAbroad.all
    elsif genre_id ==6 then
      @iizukascholarships = IizukaScholarship.all
    elsif genre_id ==7 then
      @iizukaothers = IizukaOther.all
    elsif genre_id ==8 then
      @iizukahomepages = IizukaHomepage.all
    end
  end
end
