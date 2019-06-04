require 'rails_helper'

describe RoadTripService do 
  it 'exists' do
    service = RoadTripService.new("denver,co", "pueblo,co")

    expect(service).to be_a(RoadTripService)
  end

  describe 'instance methods' do 
    it '.get_time' do 
      service = RoadTripService.new("denver,co", "pueblo,co")

      expect(service.get_time).to be_a(String)
      # expect(service.get_time).to eq("1 hour 45 mins")
    end 
  end 
end 