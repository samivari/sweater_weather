require 'rails_helper'

RSpec.describe 'Forecast Service' do
  it 'returns forecast data form longitude and latitude', :vcr do
    data = { lat: 39.738453, lng: -104.984853 }
    forecast = ForecastService.get_forecast(data[:lat], data[:lng])
    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:current)
    expect(forecast).to have_key(:hourly)
    expect(forecast).to have_key(:daily)
    expect(forecast).to_not have_key(:minutely)
    expect(forecast).to_not have_key(:alert)
  end
end
