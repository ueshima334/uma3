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
    @rap = Rap.rap_make(@race)

    @target_race = Race.where(name:params[:racename]).order('day DESC')
    @target_rap = Rap.target_rap_make(params[:racename])

    @rank = Race.rank_search(@race)
  end

private

def horse_params
  params.require(:horse).permit(:name,:horsegender_id,:age_id)
end

def move_to_index
  redirect_to root_path unless user_signed_in? && current_user.id == 1
end

end
