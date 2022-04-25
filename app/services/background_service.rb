class BackgroundService
  def self.get_background(location)
    response = Faraday.get("https://api.unsplash.com/search/photos?client_id=#{ENV['background_key']}&query=#{location}, day")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
