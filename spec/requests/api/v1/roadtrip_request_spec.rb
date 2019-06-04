
# You will use the Google Directions API:  https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then deliver the weather forecast for the hour
# of arrival.

# For example, Denver to Pueblo would take two hours. You will deliver a forecast two hours in the future that includes the temperature and summary.
# Collapse

require 'rails_helper'

 describe 'Roadtrip API' do
  it 'displays weather for destination arrival' do
  
    get '/api/v1/road_trip?start=denver,co&end=pueblo,co'

    expected = JSON.parse(response.body)
    expect(response).to be_successful

    expect(expected['data']["type"]).to eq("road_trip_forecasts")
    expect(expected['data']["attributes"]).to have_key("city")
    expect(expected['data']["attributes"]).to have_key("state")
    expect(expected['data']["attributes"]).to have_key("arrival_forecast")
    expect(expected['data']["attributes"]["arrival_forecast"]).to have_key("icon")
    expect(expected['data']["attributes"]["arrival_forecast"]).to have_key("temperature")
  end
end

