require 'open-uri'
require 'nokogiri'

url = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/db.cgi?page=DBRecord&did=357&qid=all&vid=24&rid=653&Head=&hid=&sid=n&rev=0&ssid=1-2584-30568-g226'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

doc.css('td[class*="record-value-"]' ).each do |tr|
  p tr.inner_text
end
