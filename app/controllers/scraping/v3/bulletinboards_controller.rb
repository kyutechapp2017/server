class Scraping::V3::BulletinboardsController < ApplicationController
  require 'scraping'
  include Scraping
  def index
    idsets = get_ids_for_bulletinboard

    idsets.each do |idset|
      scraping_did = idset.did
      latest_rid = idset.rid
      last_rid = get_last_rid_from_bulletinboard(scraping_did)
      get_data = bulletinboard(scraping_did, latest_rid, last_rid)

      # データ格納が死んでいる
      db_set_of_bulletinboard(get_data, scraping_did)

      update_rid(scraping_did, last_rid)
      # iizuka = [""]
      #   case scraping_did
      #   when 357 then
      #     iizuka = IizukaNotice.new(url: get_data[0], title: get_data[1], date: get_data[2], period: get_data[3], place_or_before: get_data[4], content: get_data[5], department: get_data[6], grade: get_data[7])
      #     if get_data[8] != nil then
      #       iizuka.attachment_1 = get_data[8]
      #       iizuka.attachment_1_url = get_data[9]
      #       if get_data[10] != nil then
      #         iizuka.attachment_2 = get_data[10]
      #         iizuka.attachment_2_url = get_data[11]
      #         if get_data[12] != nil then
      #           iizuka.attachment_3 = get_data[12]
      #           iizuka.attachment_3_url = get_data[13]
      #           if get_data[14] != nil then
      #             iizuka.attachment_4 = get_data[14]
      #             iizuka.attachment_4_url = get_data[15]
      #             if get_data[16] != nil then
      #               iizuka.attachment_5 = get_data[16]
      #               iizuka.attachment_5_url = get_data[17]
      #             end
      #           end
      #         end
      #       end
      #     end
      #     p iizuka
      #     # iizuka.save
      #   when 393 then
      #     iizuka = IizukaCall.new(url: get_data[0], title: get_data[1],  department: get_data[3], grade: get_data[4], content: get_data[5], note: get_data[6], date: get_data[7])
      #     # iizuka.save
      #   when 367 then
      #     iizuka = IizukaScholarship.new(url: get_data[0], title: get_data[1],  note: get_data[3], date: get_data[4], content: get_data[5])
      #     if get_data[6] != nil then
      #       iizuka.attachment_1 = get_data[6]
      #       iizuka.attachment_1_url = get_data[7]
      #       if get_data[8] != nil then
      #         iizuka.attachment_2 = get_data[8]
      #         iizuka.attachment_2_url = get_data[9]
      #       end
      #     end
      #     # iizuka.save
      #   when 379 then
      #     iizuka = IizukaIntensiveLecture.new(url: get_data[0], title: get_data[1], date: get_data[2], content: get_data[3], note: get_data[4])
      #     if get_data[5] != nil then
      #       iizuka.attachment_1 = get_data[5]
      #       iizuka.attachment_1_url = get_data[6]
      #       if get_data[7] != nil then
      #         iizuka.attachment_2 = get_data[7]
      #         iizuka.attachment_2_url = get_data[8]
      #         if get_data[9] != nil then
      #           iizuka.attachment_3 = get_data[9]
      #           iizuka.attachment_3_url = get_data[10]
      #           if get_data[11] != nil then
      #             iizuka.attachment_4 = get_data[11]
      #             iizuka.attachment_4_url = get_data[12]
      #             if get_data[13] != nil then
      #               iizuka.attachment_5 = get_data[13]
      #               iizuka.attachment_5_url = get_data[14]
      #             end
      #           end
      #         end
      #       end
      #     end
      #     # iizuka.save
      #   when 372 then
      #     iizuka = IizukaStudyingAbroad.new(url: get_data[0], title: get_data[1], responsibility: get_data[2], content: get_data[3], date: get_data[4])
      #     if get_data[5] != nil then
      #       iizuka.attachment_1 = get_data[5]
      #       iizuka.attachment_1_url = get_data[6]
      #       if get_data[7] != nil then
      #         iizuka.attachment_2 = get_data[7]
      #         iizuka.attachment_2_url = get_data[8]
      #         if get_data[9] != nil then
      #           iizuka.attachment_3 = get_data[9]
      #           iizuka.attachment_3_url = get_data[10]
      #           if get_data[11] != nil then
      #             iizuka.attachment_4 = get_data[11]
      #             iizuka.attachment_4_url = get_data[12]
      #           end
      #         end
      #       end
      #     end
      #     iizuka.save
      #   else
      #   end
      #   # iizuka.save
      #   update_rid(scraping_did, last_rid)
      # end
      # iizuka.save¥
    end
  end
end
