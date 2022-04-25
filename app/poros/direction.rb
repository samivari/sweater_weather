class Direction
  attr_reader :travel_time

  def initialize(results)
    @travel_time = results[:route][:realTime]
  end
end
