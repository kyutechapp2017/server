require 'scraping'
include Scraping

namespace :scraping do

  desc "scraping for bulletinboards"
  task bulletinboards: :environment do
    idsets = get_ids_for_bulletinboard

    idsets.each do |idset|
      scraping_did = idset.did
      latest_rid = idset.rid
      last_rid = get_last_rid_from_bulletinboard(scraping_did)
      get_data = bulletinboard(scraping_did, latest_rid, last_rid)

      # データ格納が死んでいる
      db_set_of_bulletinboard(get_data, scraping_did)

      update_rid(scraping_did, last_rid)
      binding.pry
      iizuka = [""]
      case scraping_did
      when 357 then
        iizuka = IizukaNotice.new(url: get_data[0], title: get_data[1], date: get_data[2], period: get_data[3], place_or_before: get_data[4], content: get_data[5], department: get_data[6], grade: get_data[7])
        if get_data[8] != nil then
          iizuka.attachment_1 = get_data[8]
          iizuka.attachment_1_url = get_data[9]
          if get_data[10] != nil then
            iizuka.attachment_2 = get_data[10]
            iizuka.attachment_2_url = get_data[11]
            if get_data[12] != nil then
              iizuka.attachment_3 = get_data[12]
              iizuka.attachment_3_url = get_data[13]
              if get_data[14] != nil then
                iizuka.attachment_4 = get_data[14]
                iizuka.attachment_4_url = get_data[15]
                if get_data[16] != nil then
                  iizuka.attachment_5 = get_data[16]
                  iizuka.attachment_5_url = get_data[17]
                end
              end
            end
          end
        end
        # p iizuka
        # iizuka.save
      when 393 then
        iizuka = IizukaCall.new(url: get_data[0], title: get_data[1],  department: get_data[3], grade: get_data[4], content: get_data[5], note: get_data[6], date: get_data[7])
        # iizuka.save
      when 367 then
        iizuka = IizukaScholarship.new(url: get_data[0], title: get_data[1],  note: get_data[3], date: get_data[4], content: get_data[5])
        if get_data[6] != nil then
          iizuka.attachment_1 = get_data[6]
          iizuka.attachment_1_url = get_data[7]
          if get_data[8] != nil then
            iizuka.attachment_2 = get_data[8]
            iizuka.attachment_2_url = get_data[9]
          end
        end
        # iizuka.save
      when 379 then
        iizuka = IizukaIntensiveLecture.new(url: get_data[0], title: get_data[1], date: get_data[2], content: get_data[3], note: get_data[4])
        if get_data[5] != nil then
          iizuka.attachment_1 = get_data[5]
          iizuka.attachment_1_url = get_data[6]
          if get_data[7] != nil then
            iizuka.attachment_2 = get_data[7]
            iizuka.attachment_2_url = get_data[8]
            if get_data[9] != nil then
              iizuka.attachment_3 = get_data[9]
              iizuka.attachment_3_url = get_data[10]
              if get_data[11] != nil then
                iizuka.attachment_4 = get_data[11]
                iizuka.attachment_4_url = get_data[12]
                if get_data[13] != nil then
                  iizuka.attachment_5 = get_data[13]
                  iizuka.attachment_5_url = get_data[14]
                end
              end
            end
          end
        end
        # iizuka.save
      when 372 then
        iizuka = IizukaStudyingAbroad.new(url: get_data[0], title: get_data[1], responsibility: get_data[2], content: get_data[3], date: get_data[4])
        if get_data[5] != nil then
          iizuka.attachment_1 = get_data[5]
          iizuka.attachment_1_url = get_data[6]
          if get_data[7] != nil then
            iizuka.attachment_2 = get_data[7]
            iizuka.attachment_2_url = get_data[8]
            if get_data[9] != nil then
              iizuka.attachment_3 = get_data[9]
              iizuka.attachment_3_url = get_data[10]
              if get_data[11] != nil then
                iizuka.attachment_4 = get_data[11]
                iizuka.attachment_4_url = get_data[12]
              end
            end
          end
        end
        # iizuka.save

      end
      # iizuka.save
      update_rid(scraping_did, last_rid)

      iizuka.save
    end
  end

  desc "scraping for syllabuses"
  task syllabuses: :environment do
    syllabus(11,2017)

    # get_data.each do |gdata|

      # if Subject.find_by(url: gdata[0][1], updated: gdata[0][13]) == nil then
      #
      #   subject = Subject.new(campus_id: gdata[0][0], url: gdata[0][1], year: gdata[0][2], name: gdata[0][3], code: gdata[0][4], teacher: gdata[0][5], department: gdata[0][6], classification: gdata[0][7], num_of_unit: gdata[0][8], grade: gdata[0][9], term: gdata[0][10], number: gdata[0][11], place: gdata[0][12], updated: gdata[0][13], outline: gdata[0][14], placement: gdata[0][15], item: gdata[0][16], procedure: gdata[0][17], goal: gdata[0][18], criteria: gdata[0][19], preparation: gdata[0][20], keyword: gdata[0][21], textbook: gdata[0][22], reference: gdata[0][23], note: gdata[0][24], email: gdata[0][25])
      #   subject.save
      #
      #   linkage = Subject.last
      #   link_id = linkage.id
      #   gdata[1].each do |k|
      #     wp = WeekPeriod.find_by(week_num: k[0], period_num: k[1])
      #     intmed = Intermediate.new(subject_id: link_id, week_period_id: wp.id)
      #     intmed.save
      #   end
      # end
    # end

  end

  desc "タスクの説明タスクの説明タスクの説明"
  task sample: :environment do
    put "ぶりぶりぶりぶりぃぃぃぃ"
  end
end
