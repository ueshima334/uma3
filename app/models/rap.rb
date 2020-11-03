class Rap < ApplicationRecord

belongs_to :race

validates :pace,presence: true



def self.rap_save(xml,race)

  @pace = xml.xpath('//*[@id="dbnewWrap"]/div/article/div/section//div//div/div/div[2]/text()').text.gsub(/\r\n|\r|\n|\s|\t/,"")

  a = 0
  4.times do |b| 
    b += 1   
    c = 0
    5.times do |c|
      a += 1
      c += 1
      (eval %(@rap#{a} = xml.xpath("//*[@id='dbnewWrap']/div/article/div/section//div/div[1]/table[#{b}]/tr[#{c}]/td[1]").text))

    end

  end

  @rap = Rap.create(pace: @pace,m200:@rap1,m400:@rap2,m600:@rap3,m800:@rap4,m1000:@rap5,m1200:@rap6,m1400:@rap7,m1600:@rap8,m1800:@rap9,m2000:@rap10,
    m2200:@rap11,m2400:@rap12,m2600:@rap13,m2800:@rap14,m3000:@rap15,m3200:@rap16,race_id:race.id)

    return @rap

end

def self.form_rap_save(rap)

  rap.save
  return rap

end

end
