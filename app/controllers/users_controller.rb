class UsersController < ApplicationController
  def index
    gon.weather_api_key = ENV['WEATHER_MAP_API']
  end

  def show
  end
end
