class Api::V3::BulletInBoardsController < ApplicationController
  def index
    @iizukanotices = IizukaNotice.all
    @iizukalectures = IizukaLecture.all
    @iizukacalls = IizukaCall.all
    @iizukaintensivelectures = IizukaIntensiveLecture.all
    @iizukastudyingabroads = IizukaStudyingAbroad.all
    @iizukascholarships = IizukaScholarship.all
    @iizukaothers = IizukaOther.all
    @iizukahomepages = IizukaHomepage.all
  end
end
