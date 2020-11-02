class PlansController < ApplicationController

def index
  @plan = Plan.all.order('day DESC')

end

def new
  @plan = Plan.new
end

def create

  data = params.require(:plan).permit(:url)
  
  xml = Nokogiri::XML(open(data[:url]).read)

  plan = Plan.plan_save(xml)

  if plan.valid?
    flash[:notice] = '保存に成功しました'
    redirect_to :action =>  'new' and return
  else
    flash[:alert] = '保存に失敗しました'
    @plan = Plan.new
    render :new and return
  end

end

def show
  @plan = Plan.find(params[:id])
end

end
