class RacesController < ApplicationController

def index  

  if current_user.id == 1
  @race = Race.new
  else
    redirect_to root_path and return
  end

end

def create
  data = params.require(:race).permit(:url)
  
  xml = Nokogiri::XML(open(data[:url]).read)

  race = Race.race_save(xml)

  if race.valid?
     race.save
  else
    @race = Race.new
    render :index and return
  end

  rap = Rap.rap_save(xml,race)

  if rap.save
    redirect_to :action =>  'index' and return

  else
    race.destroy
    @race = Race.new
    render :index and return
  end

end

end
