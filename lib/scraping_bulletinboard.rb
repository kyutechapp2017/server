require 'open-uri'
require 'nokogiri'
require 'kconv'
require 'date'

url_head = 'https://db.jimu.kyutech.ac.jp/cgi-bin/cbdb/'
url_tail = 'db.cgi?page=DBRecord&did=372&qid=all&vid=24&rid=185&Head=&hid=&sid=n&rev=0&ssid=1-3577-12521-g58'

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

p datas
