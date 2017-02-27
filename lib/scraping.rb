require 'open-uri'
require 'nokogiri'

url = "https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBRecord&did=357&qid=all&vid=24&rid=661&Head=&hid=&sid=n&rev=0&ssid=1-2448-4121-g196"

(660..662).each do |num|
  regexp = /rid=\d{3}/
  url_display = url.gsub(regexp, 'rid=num') # ここのnumの使い方を教えてください
  p url_display
end
