class MunchieSerializer
  def self.serialize_munchies(resturant, forecast, direction, destination)
    {
      "data": {
        "id": 'null',
        "type": 'munchie',
        "attributes": {
          "destination_city": destination,
          "travel_time": direction,
          "forecast": {
            "summary": forecast.current_weather[:conditions],
            "temperature": forecast.current_weather[:temperature]
          },
          "resturant": {
            "name": resturant.name,
            "address": resturant.address
          }
        }
      }
    }
  end
end
