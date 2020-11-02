class PlansController < ApplicationController

def index
end

def new
  @plan = Plan.new
end

def create

  data = params.require(:plan).permit(:url)
  
  xml = Nokogiri::XML(open(data[:url]).read)

  plan = Plan.plan_save(xml)

end

def show
end

end
