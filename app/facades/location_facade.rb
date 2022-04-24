class LocationFacade
  def self.find_coords(location)
    results = LocationService.get_coords(location)[:results][0][:locations][0][:latLng]
  end
end
