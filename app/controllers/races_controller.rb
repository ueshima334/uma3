class RacesController < ApplicationController

def index
  @race = Race.new
end

def create
  data = params.require(:race).permit(:url)
  
  xml = Nokogiri::XML(open(data[:url]).read)

  race = Race.race_save(xml)

  rap = Rap.rap_save(xml,race)

  unless race.valid?
    redirect_to :action =>  'index'
  end

  unless rap.valid?
    race.destroy
    redirect_to :action =>  'index'
  end

  redirect_to :action =>  'index'

end

end
