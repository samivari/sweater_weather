class RoadTripFacade
  def self.find_road_trip(origin, destination)
    direction = DirectionFacade.find_travel_time(origin, destination)
    coords = LocationFacade.find_coords(destination)
    forecast = ForecastFacade.find_forecast(coords.lat, coords.lon)
    RoadTrip.new(forecast, direction, origin, destination)
  end
end
