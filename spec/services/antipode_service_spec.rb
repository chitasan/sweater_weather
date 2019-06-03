require 'rails_helper'

RSpec.describe AntipodeService do
  it 'exists' do 
    service = AntipodeService.new('lat', 'long')

    expect(service).to be_a(AntipodeService)
  end 

  describe 'instance methods' do
    it '.get_lat' do
      service = AntipodeService.new("22.3193", "114.1694")
      antipode_lat = service.get_lat

      expect(antipode_lat).to be_a(String)
    end

    it '.get_long' do
      service = AntipodeService.new("22.3193", "114.1694")
      antipode_long = service.get_long

      expect(antipode_long).to be_a(String)
    end
  end
end
