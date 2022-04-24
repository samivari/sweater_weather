class ForecastService
  def self.get_forecast(lat, lng)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV['weather_key']}&lat=#{lat}&lon=#{lng}&units=imperial&exclude=minutely,alert")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
