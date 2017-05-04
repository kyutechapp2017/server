class Api::V3::BulletInBoardsController < ApplicationController
  def index
    @bulletinboards = IizukaCall.all
  end
end
