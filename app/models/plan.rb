class Plan < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :day
  end


  def self.plan_save(xml)
  
    title = xml.xpath('//*[@id="dbnewWrap"]/div/article/div/section//h1/text()').text.gsub(/\r\n|\r|\n|\s|\t/,"")
    grade = xml.xpath('//*[@id="dbnewWrap"]/div/article/div/section//h1/span').text.gsub(/[()]/,"") 
    day = xml.xpath('//*[@id="dbnewWrap"]/div/article/div/section//div/div[1]/div[1]/div[2]/p').text.sub!(/\n.*/,"")
    terms = xml.xpath('//*[@id="dbnewWrap"]/div/article/div/section//div/div[1]/div[1]/div[1]/div[2]/ul/li[2]').text

    n =19
    18.times do 
      n -= 1 # trの番号
    (eval %(@horse#{n} = xml.xpath("//*[@id='dbnewWrap']/div/article/div/section//div/div[1]/div[1]/table//tr[4]/td[#{n}]/div/a").text))
    end

   plan = Plan.new(title:title,grade:grade,day:day,terms:terms,horse1:@horse18,horse2:@horse17,horse3:@horse16,horse4:@horse15,horse5:@horse14,
    horse6:@horse13,horse7:@horse12,horse8:@horse11,horse9:@horse10,horse10:@horse9,horse11:@horse8,horse12:@horse7,horse13:@horse6,
    horse14:@horse5,horse15:@horse4,horse16:@horse3,horse17:@horse2,horse18:@horse1)

     plan.save
     return plan
    
  end
end
