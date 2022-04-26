class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather, :id

  def initialize(forecast, direction, origin, destination)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = route_verify(direction)
    @weather = arrival_weather(forecast, travel_time, direction)
  end

  def time_converter(direction)
    [direction.travel_time / 3600, direction.travel_time / 60 % 60, direction.travel_time % 60].map do |t|
      t.to_s.rjust(2, '0')
    end.join(':')
  end

  def route_verify(direction)
    if direction.travel_time.nil?
      'Impossible route.'
    else
      time_converter(direction)
    end
  end

  def arrival_weather(forecast, travel_time, direction)
    if travel_time == 'Impossible route.'
      'No Data.'
    else
      time = Time.new.to_i
      arrival_time = (direction.travel_time + time.to_i)
      time = Time.at(arrival_time).to_datetime

      forecast.hourly_weather.find do |h|
        time.strftime('%H').to_i == (h[:time].to_datetime).strftime('%H').to_i
      end
    end
  end
end
