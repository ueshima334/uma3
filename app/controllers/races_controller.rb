class RacesController < ApplicationController

def new  

  if current_user.id == 1
  @race = Race.new
  else
    redirect_to root_path and return
  end

end

def create

# URL登録時の処理-------
if params[:race].include?(:url)

  data = params.require(:race).permit(:url)
  
  xml = Nokogiri::XML(open(data[:url]).read)

  race = Race.race_save(xml)

  unless race.valid?
    flash[:alert] = '保存に失敗しました'
    @race = Race.new
    render :new and return
  end

  rap = Rap.rap_save(xml,race)

  if rap.valid?
    flash[:notice] = '保存に成功しました'
    redirect_to :action =>  'new' and return
  else
    race.destroy
    flash[:alert] = '保存に失敗しました'
    @race = Race.new
    render :new and return
  end

end

# フォーム入力登録時の処理-------


  race = Race.new(race_params)

  @race = Race.form_race_save(race)

  unless @race.valid?
    flash[:alert] = '保存に失敗しました'
    @race = Race.new
    render :new and return
  end

  rap = Rap.new(rap_params)

  @rap = Rap.form_rap_save(rap)
    
  if @rap.valid?
    flash[:notice] = '保存に成功しました'
    redirect_to :action =>  'new' and return
  else
    @race.destroy
    flash[:alert] = '保存に失敗しました'
    @race = Race.new
    render :new and return
  end

end

private

def race_params

  params.require(:race).permit(:name,:place,:day,:racetrack,:horse1,:horse2,:horse3,:horse4,:horse5,:horse6,:horse7,:horse8,:horse9,
    :horse10,:horse11,:horse12,:horse13,:horse14,:horse15,:horse16,:horse17,:horse18)

end

def rap_params

  params.require(:race).permit(:pace,:m200,:m400,:m600,:m800,:m1000,:m1200,:m1400,:m1600,:m1800,:m2000,:m2200,:m2400,:m2600,:m2800,:m3000,:m3200).merge(race_id:@race.id)

end

end
