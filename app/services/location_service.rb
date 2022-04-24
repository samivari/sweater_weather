class LocationService
  def self.get_coords(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['location_key']}&location=#{location}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
