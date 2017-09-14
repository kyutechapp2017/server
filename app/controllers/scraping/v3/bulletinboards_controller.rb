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
      case idset.id
      when 1 then
        iizuka = IizukaNotece.new(url: get_data[0][0], title: get_data[0][1], date: get_data[0][2], period: get_data[0][3], place_or_before: get_data[0][4], content: get_data[0][5], department: get_data[0][6], grade: get_data[0][7])
        if get_data[0][8] != nil then
          iizuka.attachment_1 = get_data[0][8]
          iizuka.attachment_1_url = get_data[0][9]
          if get_data[0][10] != nil then
            iizuka.attachment_2 = get_data[0][10]
            iizuka.attachment_2_url = get_data[0][11]
            if get_data[0][12] != nil then
              iizuka.attachment_3 = get_data[0][12]
              iizuka.attachment_3_url = get_data[0][13]
              if get_data[0][14] != nil then
                iizuka.attachment_4 = get_data[0][14]
                iizuka.attachment_4_url = get_data[0][15]
                if get_data[0][16] != nil then
                  iizuka.attachment_5 = get_data[0][16]
                  iizuka.attachment_5_url = get_data[0][17]
                end
              end
            end
          end
        end
        iizuka.save
      when 5 then
        iizuka = IizukaNotece.new(url: get_data[0][0], title: get_data[0][1],  department: get_data[0][3], grade: get_data[0][4], content: get_data[0][5], note: get_data[0][6], date: get_data[0][7])
        iizuka.save
      end
      idset.rid = get_data[1]
      idset.save
    end
  end
end
