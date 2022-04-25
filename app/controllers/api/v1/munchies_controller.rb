class Api::V1::MunchiesController < ApplicationController
  def index
    direction = DirectionFacade.find_travel_time(params[:start], params[:destination])

    coords = LocationFacade.find_coords(params[:destination])

    forecast = ForecastFacade.find_forecast(coords.lat, coords.lon)
    time = Time.new.to_i
    arrival_time = direction.travel_time + time

    resturant = ResturantFacade.find_resturant(params[:food], params[:destination], arrival_time)

    render = render(json: MunchieSerializer.serialize_munchies(resturant, forecast, direction, params[:destination]))
  end
end
