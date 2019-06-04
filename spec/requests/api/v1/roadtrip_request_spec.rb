# The object of this assessment is to create an API endpoint to assist in the planning of road trips.

# You will create an endpoint like so:, `/api/v1/road_trip?start=denver,co&end=pueblo,co`

# You will use the Google Directions API:  https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then deliver the weather forecast for the hour
# of arrival.

# For example, Denver to Pueblo would take two hours. You will deliver a forecast two hours in the future that includes the temperature and summary.
# Collapse

require 'rails_helper'

 describe 'Roadtrip API' do
  it 'displays weather upon arrival to destination' do
    location = Location.create(city: "Pubelo", state: "CO", latitude: "38.345385", longitude: "-104.460868")

    get '/api/v1/road_trip?start=denver,co&end=pueblo,co'

    expect(response).to be_successful
    data = JSON.parse(response.body)

    # expect(data["type"]).to eq("")
    # expect(data["attributes"]).to eq("")
  end
end

