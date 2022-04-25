class ResturantFacade
  def self.find_resturant(term, location, time)
    results = ResturantService.get_resturant(term, location, time)
    Resturant.new(results)
  end
end
