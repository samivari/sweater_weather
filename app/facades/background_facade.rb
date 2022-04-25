class BackgroundFacade
  def self.find_photo(location)
    results = BackgroundService.get_background(location)
    Background.new(results)
  end
end
