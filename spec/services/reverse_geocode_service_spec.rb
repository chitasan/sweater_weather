require 'rails_helper'

describe 'ReverseGeocodeService' do
  it 'exists' do
    service = ReverseGeocodeService.new('22.1662', '66.0250')
    binding.pry
    expect(service).to be_a(ReverseGeocodeService)
  end
end