class HorsesController < ApplicationController
  before_action :move_to_index, only: [:index,:new]

  def index
  end

  def new
    @horse = Horse.new
  end

  def create
    horse = Horse.new(horse_params)
    if  horse.valid? && Horse.where(name:params[:horse][:name]).empty?
      horse.save
      flash[:notice] = '保存に成功しました'
      redirect_to :action =>  'new'
    else
      flash[:alert] = '保存に失敗しました'
      @horse = Horse.new
      render :new
    end
  
  end

  def show
    @horse = Horse.find(params[:id])
    @race = Race.race_search(@horse.name)
    @rap = rapmake(@race)
  end

private

def horse_params
  params.require(:horse).permit(:name,:horsegender_id,:age_id)
end

def move_to_index
  redirect_to root_path unless user_signed_in? && current_user.id == 1
end


def rapmake(race)
  raps = []
  rap =  Rap.find_by(race_id:race[0].id) 

  raps << ['200m',rap.m200]
  raps << ['400m',rap.m400]
  raps << ['600m',rap.m600]
  raps << ['800m',rap.m800]
  raps << ['1000m',rap.m1000]
  raps << ['1200m',rap.m1200]
  raps << ['1400m',rap.m1400]
  raps << ['1600m',rap.m1600]
  raps << ['1800m',rap.m1800]
  raps << ['2000m',rap.m2000]
end

end
