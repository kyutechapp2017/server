require 'selenium-webdriver'
require "nokogiri"

url = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses"

driver = Selenium::WebDriver.for :chrome

driver.get(url)
driver.manage.timeouts.implicit_wait = 1
# driver.navigate.to(url)
select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'belong_children_faculty'))
select.select_by(:text, '情報工学部')

driver.find_element(:xpath, '//*[@id="search-simple"]/div/div[3]/button').submit

time = 10
sleep time
# とりあえず、一番上の科目をクリック
driver.find_element(:xpath, '//*[@id="main"]/div[2]/div[1]/div[1]/div/div/div[1]/ul/li[1]/a').click
sleep time

# campus_id = 11
# year = 2017
# code = 11009435
# number = "01"

doc = Nokogiri::HTML driver.page_source.encode("UTF-8")
datas = [""]
count = 0

datas_1 = [""]
count_1 = 0
excep_1 = /【.*】\s{0,10}/
doc.css('div.syllabus__information > div > div').each do |div|
  datas_1[count_1] = div.inner_text.gsub(excep_1,"")
  # if datas_1[count_1] =~ /([0-9]{4})\/([0-9]{2})\/([0-9]{2})\s\(.\)/ then
  #   datas_1[count_1].gsub!(/\s\(.\)/, "")
  # end
  count_1 = count_1 + 1
end
p datas_1

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

# datas[0] = campus_id
# count = count + 1
# datas[1] = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses/direct?faculty_code=#{campus_id}&year=#{year}&"
# datas[2] = year
# 3.


driver.quit

driver.quit
