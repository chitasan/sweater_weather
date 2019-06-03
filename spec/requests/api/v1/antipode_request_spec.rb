
# Your endpoint will give the user the original city, and the antipode's location name and its current weather summary and current temperature.
# To retrieve the antipode's name use something like Google's reverse geocoding documented here: https://developers.google.com/maps/documentation/geocoding/start
# You should reuse the code you have currently written for retrieving weather.
# Your response should resemble the structure and contain the following data:
# ```
# {
# 	"data": [{
# 		"id": "1",
# 		"type": "antipode",
# 		"attributes": {
# 			"location_name": "Antipode City Name",
# 			"forecast": {
# 				"summary": "Mostly Cloudy",
# 				"current_temperature": "72"
# 			},
# 			"search_location": "Hong Kong"
# 		}
# 	}]
# }

require 'rails_helper'

describe 'Antipode' do 
  it 'returns long and late of a city' do
    get '/api/v1/antipode?loc=hongkong'

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('antipode')
    expect(expected['data']['attributes']).to have_key('lat')
    expect(expected['data']['attributes']).to have_key('long')
    expect(expected['data']['attributes']['lat']).to have_key('-27')
    expect(expected['data']['attributes']['long']).to have_key('98')
  end 
end 