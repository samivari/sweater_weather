require 'rails_helper'

RSpec.describe 'Forecast Facade' do
  it '.find_forecast', :vcr do
    data = { lat: 39.738453, lng: -104.984853 }
    forecast = ForecastFacade.find_forecast(data[:lat], data[:lng])
    expect(forecast).to be_a(Forecast)
  end
end
