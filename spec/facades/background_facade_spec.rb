require 'rails_helper'
RSpec.describe BackgroundFacade do
  it ' makes image object', :vcr do
    image = BackgroundFacade.find_photo('Denver, CO')

    expect(image).to be_a(Background)
  end
end
