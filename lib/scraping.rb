require 'selenium-webdriver'
require "nokogiri"
require 'date'
require 'kconv'

module Scraping
  def bulletinboard(scraping_did, latest_rid)
    send_data = [""]
    send_count = 0

    datas = [""]
    rid = latest_rid + 1

    # url_top = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBView&did='
    # html = open(url_top + scraping_did, "r:binary").read
    # doc = Nokogiri::HTML.parse(html.toutf8, nil, "UTF-8")
    # doc.css('td.dz_fontSmall')
    begin

      loop do

        url_head = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/'
        url_tail = "db.cgi?page=DBRecord&did=#{scraping_did}&rid=#{rid}"

        p url_tail
        # debug

        html = open(url_head + url_tail, "r:binary").read
        doc = Nokogiri::HTML.parse(html.toutf8, nil, "UTF-8")

        place = "td[class*=\"record-value-\"]"

        datas = [url_head + url_tail]
        count = 1
        date_find = /([0-9０-９]{1,4})[\/\-\.\／－．年]{1}([0-9０-９]{1,2})[\/\-\.\／－．月]{1}([0-9０-９]{1,2})[\/\-\.\／－．日]?$/iu

        url_find = /db.cgi.+/
        regexp = /<(a href=\")|(">.*)/

        doc.css(place).each do |td|
          datas[count] = td.inner_text.gsub(/　|\r/,"")
          if(datas[count] =~ date_find) then
            date_material = datas[count].match(date_find)
            datas[count] = DateTime.parse("#{date_material[1]}-#{date_material[2]}-#{date_material[3]} ")
          end

          if td.css('a').to_s != "" then
            temp = td.css('a').to_s.gsub(regexp, "").gsub("amp;", "")
            if temp =~ url_find then
              count = count + 1
              datas[count] = url_head+temp
            end
          end

          count = count + 1
        end

        if datas == [url_head + url_tail] then
          # finish = true
          break
        end

        send_data[send_count] = datas
        send_count = send_count + 1
        rid = rid + 1

      end
    rescue
      if datas == [""] then
        p "finished"
      else
        p "some error was happened"
      end
    end
    return [send_data, rid]
    p rid
    p send_data
  end

  def syllabus(campus_id, year)

    url = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses"

    driver = Selenium::WebDriver.for :chrome

    driver.get(url)

    lecture_year = year.to_s + "年度"
    if campus_id == 11 then
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
    send_data = [""]
    send_count = 0
    while finish == false do
      begin
        loop do
          xpath = "//*[@id=\"main\"]/div[2]/div[1]/div[1]/div/div/div[#{j}]/ul/li[#{i}]/a"
          driver.find_element(:xpath, xpath).click
          sleep time - 7

          doc = Nokogiri::HTML driver.page_source.encode("UTF-8")
          datas = [""]
          count = 0
          periods = [""]

          datas_1 = [""]
          count_1 = 0
          excep_1 = /【.*】\s{0,10}/
          doc.css('div.syllabus__information > div > div').each do |div|
            datas_1[count_1] = div.inner_text.gsub(excep_1,"")
            count_1 = count_1 + 1
          end
          # p datas_1

          datas_2 = [""]
          count_2 = 0
          doc.css("p[class*=\"syllabus__section__content\"]").each do |div|
            datas_2[count_2] = div.inner_text
            count_2 = count_2 + 1
          end
          # p datas_2

          datas_3 = [""]
          temp_3 = [""]
          count_3 = 0
          count_3_2 = 0
          doc.css("td[class*=\"plan__\"]").each do |div|
            temp_3[count_3_2] = div.inner_text
            if count_3_2 == 2 then
              datas_3[count_3] = temp_3.join("　")
              count_3 = count_3 + 1
              count_3_2 = 0
            else
              count_3_2 = count_3_2 + 1
            end
          end
          # p datas_3.join("\n")

          datas_4 = ""
          excep_4 = "授業の達成目標（学習・教育到達目標との関連）"
          doc.css("div[class*=\"row syllabus__section syllabus-section--target\"]").each do |div|
            datas_4 = div.inner_text.gsub(excep_4,"")
          end
          # p datas_4

          datas[0] = campus_id
          count = count + 1
          datas[1] = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses/direct?faculty_code=#{campus_id}&year=#{year}&subject_code="
          datas[2] = year
          (0..11).each do |i|
            if i == 1 then
              datas[i+3] = datas_1[i].to_i
              datas[1] = datas[1] + datas_1[i] + "&class_code="
            elsif i == 7 then
              case datas_1[i]
              when "第1クォーター" then
                datas[i+3] = 1
              when "第2クォーター" then
                datas[i+3] = 2
              when "第3クォーター" then
                datas[i+3] = 3
              when "第4クォーター" then
                datas[i+3] = 4
              when "前期" then
                datas[i+3] = 5
              when "後期" then
                datas[i+3] = 6
              else
                datas[i+3] = 7
              end
            elsif i == 8 then
              datas[i+3] = datas_1[i]
              datas[1] = datas[1] + datas_1[i]
            elsif i == 9 then # 時間割
              temp = datas_1[i].split(",")
              array = [""]
              temp.each do |tmp|
                temp_week = [""]
                if tmp =~ /.曜\s\d限/ then
                  case tmp.match(/./)[0]
                  when "月" then
                    temp_week[0] = 1
                  when "火" then
                    temp_week[0] = 2
                  when "水" then
                    temp_week[0] = 3
                  when "木" then
                    temp_week[0] = 4
                  when "金" then
                    temp_week[0] = 5
                  else
                    temp_week[0] = 6
                  end

                  case tmp.match(/\d/)[0]
                  when "1" then
                    temp_week[1] = 1
                  when "2" then
                    temp_week[1] = 2
                  when "3" then
                    temp_week[1] = 3
                  when "4" then
                    temp_week[1] = 4
                  when "5" then
                    temp_week[1] = 5
                  else
                    temp_week[1] = 6
                  end
                else
                  temp_week = [6,6] # 変更箇所
                end
                array.push(temp_week)
              end
              periods.delete("")
              (1...array.length).each do |i|
                periods.push(array[i])
              end
            elsif i == 10
              datas[i+2] = datas_1[i]
            elsif i == 11 then
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
          # p datas
          # p periods

          send_data[send_count] = [datas, periods]
          send_count = send_count + 1


          i = i + 1
        end
      rescue
        p "#{j}:#{i}番目でエラー"
        if i ==  1 then
          finish = true
        else
          j = j + 1
          i = 1
        end
      end
    end
    driver.quit
    return send_data

  end

end
