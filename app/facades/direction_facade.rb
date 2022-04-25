class DirectionFacade
  def self.find_travel_time(from, to)
    results = DirectionService.get_travel_time(from, to)
    Direction.new(results)
  end
end
