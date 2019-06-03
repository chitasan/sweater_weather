require 'rails_helper'

RSpec.describe AntipodeService do
  it 'exists' do 
    service = AntipodeService.new('city', 'st')

    expect(service).to be_a(AntipodeService)
  end 

  # describe 'instance methods' do
  #   it '.get_antipode' do
  #     service = AntipodeService.new
  #   end
  # end
end
