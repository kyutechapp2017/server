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
      update_rid(scraping_did, last_rid)
      bulletinboard(scraping_did, latest_rid, last_rid)

    end
  end

  desc "scraping for syllabuses"
  task syllabuses: :environment do
    syllabus(11,2017)

  end

  desc "タスクの説明タスクの説明タスクの説明"
  task sample: :environment do
    put "ぶりぶりぶりぶりぃぃぃぃ"
  end
end
