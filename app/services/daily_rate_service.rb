require 'open-uri'

class DailyRateService

  def self.call
    doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_daily.asp"))
    doc.css("valute#R01235 value").text.to_f
  end
end
