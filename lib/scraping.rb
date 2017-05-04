# coding: utf-8

require 'open-uri'
require 'nokogiri'

url_scraping = "https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBRecord&did=357&rid=661"
charset = nil

[357,391,361,363,393,364,373,367,379,372,368,370].each do |did|
  regexp = /did=\d{3}/
  url_temp = url_scraping.gsub(regexp, "did=#{did}")

  (660..662).each do |rid|
    regexp = /rid=\d{3}/
    url_scraping = url_temp.gsub(regexp, "rid=#{rid}")

    html = open(url_scraping) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    regexp = /<(a href=\")|(">.*)/
    p url_scraping
    doc.css('td[class*="record-value-"]' ).each do |tr|
      p tr.inner_text.gsub(/(\s)|([\t| |　]+)|[\u00A0]/,"")
      if tr.css('a').to_s != "" then
          p tr.css('a').to_s.gsub(regexp, "")
      end
    end
  end
end
