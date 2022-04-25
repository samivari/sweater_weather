class ResturantService
  def self.get_url(url, term, location, time)
    conn = Faraday.new(url: 'https://api.yelp.com') do |faraday|
      faraday.headers['Authorization'] = ENV['api_key']
      faraday.params['term'] = term
      faraday.params['location'] = location
      faraday.params['open_at'] = time
      faraday.params['limit'] = 1
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_resturant(term, location, time)
    get_url('/v3/businesses/search', term, location, time)
  end
end
