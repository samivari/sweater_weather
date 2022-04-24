class ForecastFacade
  def self.find_forecast(lat, lng)
    results = ForecastService.get_forecast(lat, lng)
    time_values = {
      current_weather: results[:current],
      hourly_weather: results[:hourly],
      daily_weather: results[:daily].first(5)
    }
    Forecast.new(time_values)
  end
end
