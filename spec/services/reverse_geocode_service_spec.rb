require 'rails_helper'

describe 'ReverseGeocodeService' do
  it 'exists' do
    service = ReverseGeocodeService.new('-22.1662', '-66.0250')

    expect(service).to be_a(ReverseGeocodeService)
  end

  describe 'instance methods' do
    it '.get_city' do
      service = ReverseGeocodeService.new('-22.1662', '-66.0250')
      city = service.get_city
  
      expect(city).to be_a(String)
    end

    it '.get_state' do
      service = ReverseGeocodeService.new('-22.1662', '-66.0250')
      state = service.get_state

      expect(state).to be_a(String)
    end
  end
end