class Api::V1::BackgroundsController < ApplicationController
  def index
    photo = BackgroundFacade.find_photo(params['location'])
    render = render(json: BackgroundSerializer.new(photo))
  end
end
