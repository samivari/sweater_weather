class MunchieSerializer
  def self.serialize_munchies(_resturant, forecast, direction, destination)
    require 'pry'
    binding.pry
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
          "restaurant": {
            "name": resturant.name,
            "address": resturant.address
          }
        }
      }
    }
  end
end
