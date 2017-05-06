class Api::V3::BulletInBoardsController < ApplicationController
  def index
    @iizukanotices = IizukaNotice.all
    @iizukacalls = IizukaCall.all

  end
end
