class Scraping::V3::BulletinboardsController < ApplicationController
  require 'scraping'
  include Scraping
  def index
    idsets = IdOfBulletinboard.all
    idsets.each do |idset|
      scraping_did = idset.did
      latest_rid = idset.rid
      get_data = bulletinboard(scraping_did, latest_rid)
      #  格納
      idset.rid = get_data[1]
      idset.save
    end
  end
end
