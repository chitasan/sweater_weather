require 'rails_helper'

describe RoadTripForecasts, type: :model do
  it 'exists' do
    forecast = RoadTripForecasts.new('denver,co', 'pueblo,co')

    expect(forecast).to be_a(RoadTripForecasts)
    expect(forecast.city).to eq('pueblo')
    expect(forecast.state).to eq('co')
  end

  describe 'instance methods' do 
    it '.get_destination_arrival_weather' do
      forecast = RoadTripForecasts.new('denver,co', 'pueblo,co')
      # binding.pry
      # expect(forecast.get_destination_arrival_weather)
    end 
  end 
end 