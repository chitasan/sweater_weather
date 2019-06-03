require 'rails_helper'

describe 'Antipode' do 
  it 'returns antipode of origin city with weather info' do
    get '/api/v1/antipode?loc=hongkong'

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('antipode')
    expect(expected['data']['id']).to eq('1')
    expect(expected['data']['attributes']).to have_key('location_name')
    expect(expected['data']['attributes']).to have_key('forecast')
    expect(expected['data']['attributes']['lat']).to have_key('-22.1662')
    expect(expected['data']['attributes']['long']).to have_key('66.0250')
  end 
end 