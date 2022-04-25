require 'rails_helper'
RSpec.describe Background do
  it 'creates background paoro', :vcr do
    data = BackgroundService.get_background('Denver,CO')
    background = Background.new(data)
    expect(background).to be_a(Background)
    expect(background.author).to be_a(String)
    expect(background.image_url).to be_a(String)
    expect(background.location).to be_a(String)
    expect(background.logo).to be_a(String)
    expect(background.source).to be_a(String)
  end
end
