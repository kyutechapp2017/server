require 'selenium-webdriver'
require "nokogiri"
require 'date'
require 'kconv'
require 'open-uri'

module Scraping
  def get_ids_for_bulletinboard
    idsets = IdOfBulletinboard.all
    return idsets
  end

  def get_last_rid_from_bulletinboard(scraping_did)
    url = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBView&did='
    html = open(url + scraping_did.to_s, "r:binary").read
    doc = Nokogiri::HTML.parse(html.toutf8, nil, "UTF-8")
    temp_rid = doc.css('td.dz_fontSmall > a').attribute('href').value
    last_rid = temp_rid.match(/rid=\d{0,4}/)[0].gsub(/rid=/, "")
    return last_rid.to_i
  end

  def update_rid(scraping_did, last_rid)
    idset = IdOfBulletinboard.find_by(did: scraping_did)
    idset.rid = last_rid
    idset.save
  end

  def bulletinboard(scraping_did, latest_rid, last_rid)
    send_data = []
    send_count = 0

    datas = []
    rid = latest_rid + 1

    begin

      while rid != last_rid + 1 do

        url_head = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/'
        url_tail = "db.cgi?page=DBRecord&did=#{scraping_did}&rid=#{rid}"

        html = open(url_head + url_tail, "r:binary").read
        doc = Nokogiri::HTML.parse(html.toutf8, nil, "UTF-8")

        place = "td[class*=\"record-value-\"]"

        datas = [url_head + url_tail]
        count = 1
        date_find = /^\d{4}年\d{1,2}月\d{1,2}日$/

        url_find = /db.cgi.+/
        regexp = /<(a href=\")|(">.*)/

        doc.css(place).each do |td|
          datas[count] = td.inner_text.gsub(/　|\r/,"")
          if datas[count] =~ date_find
            date_material = datas[count].scan(/\d{1,4}/)
            datas[count] = DateTime.parse("#{date_material[0]}-#{date_material[1]}-#{date_material[2]} ")
          end

          if td.css('a').to_s != ""
            temp = td.css('a').to_s.gsub(regexp, "").gsub("amp;", "")
            if temp =~ url_find
              count = count + 1
              datas[count] = url_head+temp
            end
          end

          count = count + 1
        end

        get_data = datas

        db_set_of_bulletinboard(get_data, scraping_did)

        rid = rid + 1

      end
    rescue
      if datas == []
        p "finished"

      else
        p "some error was happened at #{scraping_did}"
      end
    end
  end

  def db_set_of_bulletinboard(get_data, scraping_did)
    case scraping_did
    when 357 then
      iizuka = IizukaNotice.new(url: get_data[0], title: get_data[1], date: get_data[2], period: get_data[3], place_or_before: get_data[4], content: get_data[5], department: get_data[6], grade: get_data[7])
      if get_data[8] != nil
        iizuka.attachment_1 = get_data[8]
        iizuka.attachment_1_url = get_data[9]
        if get_data[10] != nil
          iizuka.attachment_2 = get_data[10]
          iizuka.attachment_2_url = get_data[11]
          if get_data[12] != nil
            iizuka.attachment_3 = get_data[12]
            iizuka.attachment_3_url = get_data[13]
            if get_data[14] != nil
              iizuka.attachment_4 = get_data[14]
              iizuka.attachment_4_url = get_data[15]
              if get_data[16] != nil
                iizuka.attachment_5 = get_data[16]
                iizuka.attachment_5_url = get_data[17]
              end
            end
          end
        end
      end
      iizuka.save
    when 391 then
      iizuka = IizukaAlteration.new(url: get_data[0], title: get_data[1],  subject: get_data[2], responsibility: get_data[3], department: get_data[4], grade: get_data[5], date: get_data[6], period: get_data[7], note: get_data[8], place_or_before: get_data[9], after: get_data[10], content: get_data[11])
      iizuka.save
    when 361 then
      iizuka = IizukaCancellation.new(url: get_data[0], date: get_data[1],  period: get_data[2], subject: get_data[3], responsibility: get_data[4], place_or_before: get_data[5], department: get_data[6], grade: get_data[7], note: get_data[8])
      iizuka.save
    when 363 then
      iizuka = IizukaSupplementaryClass.new(url: get_data[0], date: get_data[1],  period: get_data[2], subject: get_data[3], responsibility: get_data[4], place_or_before: get_data[5], department: get_data[6], grade: get_data[7], note: get_data[8])
      iizuka.save
    when 393 then
      iizuka = IizukaCall.new(url: get_data[0], title: get_data[1],  department: get_data[3], grade: get_data[4], content: get_data[5], note: get_data[6], date: get_data[7])
      iizuka.save
    when 364 then
      iizuka = IizukaExamAdjustment.new(url: get_data[0], title: get_data[1], date: get_data[2], period: get_data[3], place_or_before: get_data[4], content: get_data[5], department: get_data[6], grade: get_data[7], responsibility: get_data[8])
      if get_data[9] != nil
        iizuka.attachment_1 = get_data[9]
        iizuka.attachment_1_url = get_data[10]
        if get_data[11] != nil
          iizuka.attachment_2 = get_data[11]
          iizuka.attachment_2_url = get_data[12]
          if get_data[13] != nil
            iizuka.attachment_3 = get_data[13]
            iizuka.attachment_3_url = get_data[14]
            if get_data[15] != nil
              iizuka.attachment_4 = get_data[15]
              iizuka.attachment_4_url = get_data[16]
              if get_data[17] != nil
                iizuka.attachment_5 = get_data[17]
                iizuka.attachment_5_url = get_data[18]
              end
            end
          end
        end
      end
      iizuka.save
    when 373 then
      iizuka = IizukaOther.new(url: get_data[0], title: get_data[1],  responsibility: get_data[2], content: get_data[3], note: get_data[4], date: get_data[5])
      if get_data[6] != nil
        iizuka.attachment_1 = get_data[6]
        iizuka.attachment_1_url = get_data[7]
        if get_data[8] != nil
          iizuka.attachment_2 = get_data[8]
          iizuka.attachment_2_url = get_data[9]
          if get_data[10] != nil
            iizuka.attachment_3 = get_data[10]
            iizuka.attachment_3_url = get_data[11]
            if get_data[12] != nil
              iizuka.attachment_4 = get_data[12]
              iizuka.attachment_4_url = get_data[13]
            end
          end
        end
      end
      iizuka.board_id = 1
      iizuka.save
    when 367 then
      iizuka = IizukaScholarship.new(url: get_data[0], title: get_data[1],  note: get_data[2], date: get_data[3], content: get_data[4])
      if get_data[5] != nil
        iizuka.attachment_1 = get_data[5]
        iizuka.attachment_1_url = get_data[6]
        if get_data[7] != nil
          iizuka.attachment_2 = get_data[7]
          iizuka.attachment_2_url = get_data[8]
        end
      end
      iizuka.save
    when 379 then
      iizuka = IizukaIntensiveLecture.new(url: get_data[0], title: get_data[1], date: get_data[2], content: get_data[3], note: get_data[4])
      if get_data[5] != nil
        iizuka.attachment_1 = get_data[5]
        iizuka.attachment_1_url = get_data[6]
        if get_data[7] != nil
          iizuka.attachment_2 = get_data[7]
          iizuka.attachment_2_url = get_data[8]
          if get_data[9] != nil
            iizuka.attachment_3 = get_data[9]
            iizuka.attachment_3_url = get_data[10]
            if get_data[11] != nil
              iizuka.attachment_4 = get_data[11]
              iizuka.attachment_4_url = get_data[12]
              if get_data[13] != nil
                iizuka.attachment_5 = get_data[13]
                iizuka.attachment_5_url = get_data[14]
              end
            end
          end
        end
      end
      iizuka.save
    when 372 then
      iizuka = IizukaStudyingAbroad.new(url: get_data[0], title: get_data[1], responsibility: get_data[2], content: get_data[3], date: get_data[4])
      if get_data[5] != nil
        iizuka.attachment_1 = get_data[5]
        iizuka.attachment_1_url = get_data[6]
        if get_data[7] != nil
          iizuka.attachment_2 = get_data[7]
          iizuka.attachment_2_url = get_data[8]
          if get_data[9] != nil
            iizuka.attachment_3 = get_data[9]
            iizuka.attachment_3_url = get_data[10]
            if get_data[11] != nil
              iizuka.attachment_4 = get_data[11]
              iizuka.attachment_4_url = get_data[12]
            end
          end
        end
      end
      iizuka.save
    when 368 then
      iizuka = IizukaOther.new(url: get_data[0], title: get_data[1],  content: get_data[2], note: get_data[3])
      if get_data[4] != nil
        iizuka.attachment_1 = get_data[4]
        iizuka.attachment_1_url = get_data[5]
        if get_data[6] != nil
          iizuka.attachment_2 = get_data[6]
          iizuka.attachment_2_url = get_data[7]
          if get_data[8] != nil
            iizuka.attachment_3 = get_data[8]
            iizuka.attachment_3_url = get_data[9]
            if get_data[10] != nil
              iizuka.attachment_4 = get_data[10]
              iizuka.attachment_4_url = get_data[11]
              if get_data[12] != nil
                iizuka.attachment_5 = get_data[12]
                iizuka.attachment_5_url = get_data[13]
              end
            end
          end
        end
      end
      iizuka.board_id = 2
      iizuka.save
    when 370 then
      iizuka = IizukaOther.new(url: get_data[0], title: get_data[1],  content: get_data[2], note: get_data[3])
      if get_data[4] != nil
        iizuka.attachment_1 = get_data[4]
        iizuka.attachment_1_url = get_data[5]
        if get_data[6] != nil
          iizuka.attachment_2 = get_data[6]
          iizuka.attachment_2_url = get_data[7]
          if get_data[8] != nil
            iizuka.attachment_3 = get_data[8]
            iizuka.attachment_3_url = get_data[9]
            if get_data[10] != nil
              iizuka.attachment_4 = get_data[10]
              iizuka.attachment_4_url = get_data[11]
              if get_data[12] != nil
                iizuka.attachment_5 = get_data[12]
                iizuka.attachment_5_url = get_data[13]
              end
            end
          end
        end
      end
      iizuka.board_id = 3
      iizuka.save
    else

    end
  end

  def get_datas_1_from_syllabus(doc)
    datas_1 = []
    excep_1 = /【.*】\s{0,10}/
    doc.css('div.syllabus__information > div > div').each_with_index do |div, index|
      datas_1[index] = div.inner_text.gsub(excep_1,"")
    end
    return datas_1
  end

  def get_datas_2_from_syllabus(doc)
    datas_2 = []
    doc.css("p[class*=\"syllabus__section__content\"]").each_with_index do |div, index|
      datas_2[index] = div.inner_text
    end
    return datas_2
  end

  def get_datas_3_from_syllabus(doc)
    datas_3 = []
    temp_3 = []
    count_3_2 = 0
    doc.css("td[class*=\"plan__\"]").each_with_index do |div, index|
      temp_3[count_3_2] = div.inner_text
      if count_3_2 == 2
        datas_3[index] = temp_3.join("　")
        count_3_2 = 0
      else
        count_3_2 = count_3_2 + 1
      end
    end
    return datas_3
  end

  def get_datas_4_from_syllabus(doc)
    datas_4 = ""
    excep_4 = "授業の達成目標（学習・教育到達目標との関連）"
    doc.css("div[class*=\"row syllabus__section syllabus-section--target\"]").each do |div|
      datas_4 = div.inner_text.gsub(excep_4,"")
    end
    return datas_4
  end

  def select_term_for_syllabus(term)
    ret = 0
    case term
    when "第1クォーター" then
      ret = 1
    when "第2クォーター" then
      ret = 2
    when "第3クォーター" then
      ret = 3
    when "第4クォーター" then
      ret = 4
    when "前期" then
      ret = 5
    when "後期" then
      ret = 6
    else
      ret = 7
    end
    return ret
  end

  def select_week_for_syllabus(week)
    ret = 0
    case week
    when "月" then
      ret = 1
    when "火" then
      ret = 2
    when "水" then
      ret = 3
    when "木" then
      ret = 4
    when "金" then
      ret = 5
    else
      ret = 6
    end
    return ret
  end

  def select_period_for_syllabus(period)
    ret = 0
    case period
    when "1" then
      ret = 1
    when "2" then
      ret = 2
    when "3" then
      ret = 3
    when "4" then
      ret = 4
    when "5" then
      ret = 5
    else
      ret = 6
    end
    return ret
  end

  def syllabus(campus_id, year)

    url = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses"

    driver = Selenium::WebDriver.for :chrome

    driver.get(url)

    lecture_year = year.to_s + "年度"
    if campus_id == 11
      campus_name = "情報工学部"
    end

    select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'q[lecture_year_eq]'))
    select.select_by(:text, lecture_year)


    select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'belong_children_faculty'))
    select.select_by(:text, campus_name)

    driver.find_element(:xpath, '//*[@id="search-simple"]/div/div[3]/button').submit

    time = 8
    sleep time

    i = 1
    j = 1
    finish = false
    send_data = []
    send_count = 0
    while finish == false do
      begin
        loop do
          xpath = "//*[@id=\"main\"]/div[2]/div[1]/div[1]/div/div/div[#{j}]/ul/li[#{i}]/a"
          driver.find_element(:xpath, xpath).click
          sleep time - 5

          doc = Nokogiri::HTML driver.page_source.encode("UTF-8")
          datas = []
          count = 0
          periods = []

          datas_1 = get_datas_1_from_syllabus(doc)

          datas_2 = get_datas_2_from_syllabus(doc)

          datas_3 = get_datas_3_from_syllabus(doc)

          datas_4 = get_datas_4_from_syllabus(doc)

          datas[0] = campus_id
          count = count + 1
          datas[1] = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses/direct?faculty_code=#{campus_id}&year=#{year}&subject_code="
          datas[2] = year
          (0..11).each do |i|
            if i == 1
              datas[i+3] = datas_1[i].to_i
              datas[1] = datas[1] + datas_1[i] + "&class_code="
            elsif i == 7
              datas[i+3] = select_term_for_syllabus(datas_1[i])
            elsif i == 8
              datas[i+3] = datas_1[i]
              datas[1] = datas[1] + datas_1[i]
            elsif i == 9
              temp = datas_1[i].split(",")
              array = []
              temp.each do |tmp|
                temp_week = []
                if tmp =~ /.曜\s\d限/
                  temp_week[0] = select_week_for_syllabus(tmp.match(/./)[0])
                  temp_week[1] = select_period_for_syllabus(tmp.match(/\d/)[0])
                else
                  temp_week = [6,6]
                end
                array << temp_week
              end
              (0...array.length).each do |i|
                periods << array[i]
              end
            elsif i == 10
              datas[i+2] = datas_1[i]
            elsif i == 11
              datas[i+2] = DateTime.parse(datas_1[i].gsub!(/\s\(.\)/, ""))
            else
              datas[i+3] = datas_1[i]
            end
          end

          (0..9).each do |i|
            case i
            when 0, 1 then
              datas[i+14] = datas_2[i]
            when 2 then
              datas[i+14] = datas_3.join("\n")
              datas[i+15] = datas_2[i]
            when 3 then
              datas[i+15] = datas_4
              datas[i+16] = datas_2[i]
            else
              datas[i+16] = datas_2[i]
            end
          end

          db_set_of_syllabus(datas, periods)

          i = i + 1
        end
      rescue
        p "#{j}:#{i}番目でエラー"
        if i ==  1
          finish = true
        else
          j = j + 1
          i = 1
        end
      end
    end

    driver.quit

  end

  def db_set_of_syllabus(gdata, periods)
    subjects = Subject.find_or_initialize_by(campus_id: gdata[0], url: gdata[1], year: gdata[2], name: gdata[3], code: gdata[4], teacher: gdata[5], department: gdata[6], classification: gdata[7], num_of_unit: gdata[8], grade: gdata[9], term: gdata[10], number: gdata[11], place: gdata[12], updated: gdata[13], outline: gdata[14], placement: gdata[15], item: gdata[16], procedure: gdata[17], goal: gdata[18], criteria: gdata[19], preparation: gdata[20], keyword: gdata[21], textbook: gdata[22], reference: gdata[23], note: gdata[24], email: gdata[25])

    binding.pry
    if subjects.new_record?
      periods.each do |k|
        binding.pry
        wp = WeekPeriod.find_by(week_num: k[0], period_num: k[1])
        subjects.week_periods << wp
      end
      # ここがうまくいかない
      subjects.save
    end

  end

end
