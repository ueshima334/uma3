API_KEY = "73d43f1ff709c9a98e5070ac050bb160"
BASE_URL = "https://api.openweathermap.org/data/2.5/forecast/"

require "json"
require "open-uri"

response = open(BASE_URL + "?id=1859171&APPID=#{"73d43f1ff709c9a98e5070ac050bb160"}")
puts JSON.pretty_generate(JSON.parse(response.read))