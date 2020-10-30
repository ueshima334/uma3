class Race < ApplicationRecord
  require 'mechanize'

  has_one :rap

  with_options presence: true do
    validates :name
    validates :racetrack
    validates :day
  end

def self.race_save(xml)

  @racename = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/h1/text()').text.gsub(/\r\n|\r|\n|\s|\t/,"")
  @place = xml.xpath('  //*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/p').text.slice(/札幌|函館|福島|新潟|中山|東京|中京|京都|阪神|小倉/)
  binding.pry
  @day = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/p').text.sub!(/\n.*/,"")
  @racetrack = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/div/ul/li[2]').text
  #  レース名、日付、馬場状態、ペースのテキストをそれぞれインスタンス変数に代入
  
  @horses = []
  18.times do |n|
    n += 1 # trの番号
  (eval %(@horse#{n} = xml.xpath("//*[@id='tab1']/div[2]/div[3]/table/tbody/tr[#{n}]/td[4]").text))
  # @horses << xml.xpath("//*[@id='tab1']/div[2]/div[3]/table/tbody/tr[#{n}]/td[4]").text
  # 1着〜18着の馬名を順に@horsesの配列に入れていく
  end

  @race = Race.create(name: @racename,day: @day,place:@place,racetrack: @racetrack,horse1: @horse1,horse2: @horse2,horse3: @horse3,horse4: @horse4,
    horse5: @horse5,horse6: @horse6,horse7: @horse7,horse8: @horse8,horse9: @horse9,horse10: @horse10,horse11: @horse11,
    horse12: @horse12,horse13: @horse13,horse14: @horse14,horse15: @horse15,horse16: @horse16,horse17: @horse17,horse18: @horse18)
  
return @race

end

end
