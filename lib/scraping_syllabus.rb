# coding: utf-8

require 'open-uri'
require 'nokogiri'

url_scraping = "https://edragon-syllabus.jimu.kyutech.ac.jp/guest/syllabuses/direct?faculty_code=11&year=2017&subject_code=11354090&class_code=01"
charset = nil

# [357,391,361,363,393,364,373,367,379,372,368,370].each do |did|
  # regexp = /did=\d{3}/
  # url_temp = url_scraping.gsub(regexp, "did=#{did}")

# (670..672).each do |rid|
#   regexp = /rid=(.*)/
#   url_scraping = url_temp.gsub(regexp, "rid=#{rid}")

html = open(url_scraping) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

p url_scraping
doc.css('p.syllabus__section__content').each do |tr| # 改良！？
  p tr #.inner_text #.gsub(/(\s)|([\t| |　]+)|[\u00A0]/,"")
end
p doc.title
# end
# end
