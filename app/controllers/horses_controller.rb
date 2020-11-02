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
      binding.pry
      horse.save
      flash[:notice] = '保存に成功しました'
      redirect_to :action =>  'new'
    else
      flash[:alert] = '保存に失敗しました'
      @horse = Horse.new
      render :new
    end
  
  end


private

def horse_params
  params.require(:horse).permit(:name,:horsegender_id,:age_id)
end

def move_to_index
  redirect_to root_path unless user_signed_in? && current_user.id == 1
end

end
