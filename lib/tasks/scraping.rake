require 'scraping'
include Scraping

namespace :scraping do

  desc "scraping for bulletinboards"
  task bulletinboards: :environment do

  end

  desc "scraping for syllabuses"
  task syllabuses: :environment do
    get_data = syllabus(11,2017)

    get_data.each do |gdata|

      if Subject.find_by(url: gdata[0][1], updated: gdata[0][13]) == nil then

        subject = Subject.new(campus_id: gdata[0][0], url: gdata[0][1], year: gdata[0][2], name: gdata[0][3], code: gdata[0][4], teacher: gdata[0][5], department: gdata[0][6], classification: gdata[0][7], num_of_unit: gdata[0][8], grade: gdata[0][9], term: gdata[0][10], number: gdata[0][11], place: gdata[0][12], updated: gdata[0][13], outline: gdata[0][14], placement: gdata[0][15], item: gdata[0][16], procedure: gdata[0][17], goal: gdata[0][18], criteria: gdata[0][19], preparation: gdata[0][20], keyword: gdata[0][21], textbook: gdata[0][22], reference: gdata[0][23], note: gdata[0][24], email: gdata[0][25])
        subject.save

        linkage = Subject.last
        link_id = linkage.id
        gdata[1].each do |k|
          wp = WeekPeriod.find_by(week_num: k[0], period_num: k[1])
          intmed = Intermediate.new(subject_id: link_id, week_period_id: wp.id)
          intmed.save
        end
      end
    end
  end

  desc "タスクの説明タスクの説明タスクの説明"
  task sample: :environment do
    put "ぶりぶりぶりぶりぃぃぃぃ"
  end
end
