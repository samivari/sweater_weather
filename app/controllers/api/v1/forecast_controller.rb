class Api::V1::ForecastController < ApplicationController
  def index
    coords = LocationFacade.find_coords(params['location'])
    forecast = ForecastFacade.find_forecast(coords.lat, coords.lon)
    render = render(json: ForecastSerializer.serialize_weather(forecast))
  end
end
