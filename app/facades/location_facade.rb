class LocationFacade
  def self.find_coords(location)
    results = LocationService.get_coords(location)
    Location.new(results)
  end
end
