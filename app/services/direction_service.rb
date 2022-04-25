class DirectionService
  def self.get_travel_time(from, to)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['location_key']}&from=#{from}&to=#{to}&formattedTime")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
