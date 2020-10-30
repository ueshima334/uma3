class Rap < ApplicationRecord

belongs_to :race



def self.rap_save(xml,race)

  @pace = xml.xpath('//*[@id="tab1"]/div[2]/div[6]/div[2]').text

  a = 0
  4.times do |b| 
    b += 1   
    c = 0
    5.times do |c|
      a += 1
      c += 1
      (eval %(@rap#{a} = xml.xpath("//*[@id='tab1']/div[2]/div[6]/div[1]/table[#{b}]/tr[#{c}]/td[1]").text))
    end
  # ラップタイムを200mから順に@rapsの配列に入れていく
  end

  @rap = Rap.create(pace: @pace,m200:@rap1,m400:@rap2,m600:@rap3,m800:@rap4,m1000:@rap5,m1200:@rap6,m1400:@rap7,m1600:@rap8,m1800:@rap9,m2000:@rap10,
    m2200:@rap11,m2400:@rap12,m2600:@rap13,m2800:@rap14,m3000:@rap15,m3200:@rap16,race_id:race.id)

   return @rap

end

end
