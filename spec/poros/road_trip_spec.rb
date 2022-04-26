require 'rails_helper'
RSpec.describe RoadTrip do
  describe 'happy path' do
    it 'creates a roadtrip from multiple data types happy path', :vcr do
      origin = 'denver,co'
      destination = 'pueblo,co'
      roadtrip = RoadTripFacade.find_road_trip(origin, destination)

      expect(roadtrip).to be_a(RoadTrip)
      expect(roadtrip.end_city).to eq('pueblo,co')
      expect(roadtrip.start_city).to eq('denver,co')
      expect(roadtrip.travel_time).to eq('01:48:50')
      expect(roadtrip.weather).to be_a Hash
      expect(roadtrip.weather).to have_key(:time)
      expect(roadtrip.weather).to have_key(:temperature)
      expect(roadtrip.weather).to have_key(:conditions)
    end
  end
  describe 'sad path' do
    it 'cannot create a roadtrip from multiple data types sad path', :vcr do
      origin = 'denver,co'
      destination = 'honolulu,hi'
      roadtrip = RoadTripFacade.find_road_trip(origin, destination)
      expect(roadtrip).to be_a(RoadTrip)
      expect(roadtrip.weather).to eq('No Data.')
      expect(roadtrip.travel_time).to eq('Impossible route.')
    end
  end
end
