class Race < ApplicationRecord
  require 'mechanize'

  has_one :rap

  with_options presence: true do
    validates :name
    validates :racetrack
    validates :day
    validates :horse1
  end

def self.race_save(xml)

  @racename = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/h1/text()').text.gsub(/\r\n|\r|\n|\s|\t/,"")
  @place = xml.xpath('  //*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/p').text.slice(/札幌|函館|福島|新潟|中山|東京|中京|京都|阪神|小倉/)
  @day = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/p').text.sub!(/\n.*/,"")
  @racetrack = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/div/ul/li[2]').text
  #  レース名、日付、馬場状態、ペースのテキストをそれぞれインスタンス変数に代入

  18.times do |n|
    n += 1 # trの番号
  (eval %(@horse#{n} = xml.xpath("//*[@id='dbnewWrap']/div/article/div/section//div/div[1]//table/tbody/tr[#{n}]/td[4]").text))

  end

  @race = Race.new(name: @racename,day: @day,place:@place,racetrack: @racetrack,horse1: @horse1,horse2: @horse2,horse3: @horse3,horse4: @horse4,
    horse5: @horse5,horse6: @horse6,horse7: @horse7,horse8: @horse8,horse9: @horse9,horse10: @horse10,horse11: @horse11,
    horse12: @horse12,horse13: @horse13,horse14: @horse14,horse15: @horse15,horse16: @horse16,horse17: @horse17,horse18: @horse18)

    if Race.exists?(name:@racename,day:@day) #既に登録されているレースの場合、登録できない
    @race = Race.new
   return @race

  else @race.save

   return @race
  
  end

end

def self.form_race_save(race)

   race.save
   return race

end

def self.race_search(horsename)

  race = Race.where(horse1:horsename).or(Race.where(horse2:horsename)).or(Race.where(horse3:horsename)).or(Race.where(horse4:horsename))
  .or(Race.where(horse5:horsename)).or(Race.where(horse6:horsename)).or(Race.where(horse7:horsename)).or(Race.where(horse8:horsename))
  .or(Race.where(horse9:horsename)).or(Race.where(horse10:horsename)).or(Race.where(horse11:horsename)).or(Race.where(horse12:horsename))
  .or(Race.where(horse13:horsename)).or(Race.where(horse14:horsename)).or(Race.where(horse15:horsename)).or(Race.where(horse16:horsename))
  .or(Race.where(horse17:horsename)).or(Race.where(horse18:horsename)).includes(:rap).order('day DESC')
#選択された馬が出走していた過去のレースを降順で全て取得し、戻り値とする。

end

def self.rank_search(races)

rank = []
  races.each do |race|
n = 1
    horses = []

    while race.send("horse#{n}") != ""
    horses << race.send("horse#{n}")
    n += 1
if n == 18
  break
end
    end
    rank << horses 

  end

  return rank

end


end
