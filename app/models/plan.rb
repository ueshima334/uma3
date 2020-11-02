class Plan < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :day
  end


  def self.plan_save(xml)
  
    title = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/h1').text.gsub(/\r\n|\r|\n|\s|\t/,"")
    grade = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/div/h1/span').text.gsub(/[()]/,"")  
    day = xml.xpath('//*[@id="tab1"]/div[2]/div[1]/div[1]/div[1]/div[2]/p').text.sub!(/\n.*/,"")

    18.times do |n|
      n += 1 # trの番号
    (eval %(@horse#{n} = xml.xpath("//*[@id='tab1']/div[2]/div[3]/table/tbody/tr[#{n}]/td[4]").text))
    end

  end
end
