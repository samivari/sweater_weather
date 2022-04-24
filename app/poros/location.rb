class Location
  attr_reader :lat,
              :lon

  def initialize(results)
    @lat = (results)[:results][0][:locations][0][:latLng][:lat]
    @lon = (results)[:results][0][:locations][0][:latLng][:lng]
  end
end
