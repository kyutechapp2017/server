# coding: utf-8

require 'open-uri'
require 'nokogiri'

url = "https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBRecord&did=357&qid=all&vid=24&rid=661&Head=&hid=&sid=n&rev=0&ssid=1-2448-4121-g196"
charset = nil

(660..662).each do |num|
  regexp = /rid=\d{3}/
  url_scraping = url.gsub(regexp, "rid=#{num}")

  html = open(url_scraping) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  doc.css('td[class*="record-value-"]' ).each do |tr|
    p tr.inner_text.gsub(/(\s)|([\t| |　]+)|[\u00A0]/,"")
  end
end
