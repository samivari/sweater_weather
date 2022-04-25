class Background
  attr_reader :location, :image_url, :source, :author, :logo

  def initialize(results)
    @location = results[:results][1][:user][:location]
    @image_url = results[:results][1][:urls][:full]
    @source = results[:results][1][:links][:self]
    @author = results[:results][1][:user][:name]
    @logo = results[:results][1][:user][:profile_image][:small]
  end
end
