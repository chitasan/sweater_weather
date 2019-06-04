require 'rails_helper'

describe RoadTripForecasts, type: :model do
  it 'exists' do
    forecast = RoadTripForecasts.new('denver,co', 'pueblo,co')

    expect(forecast).to be_a(RoadTripForecasts)
    expect(forecast.city).to eq('Pueblo')
    expect(forecast.state).to eq('CO')
  end


end 