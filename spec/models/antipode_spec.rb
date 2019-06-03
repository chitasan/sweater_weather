require 'rails_helper' 

describe Antipode, type: :model do
  describe 'instance methods' do
    it '.forecast' do
      antipode = Antipode.new("hongkong,cn")
      binding.pry
      expect(antipode.forecast).to be_a(Hash)
      # expect(antipode.forecast).to have_key()
      # expect(antipode.forecast).to be_a(Hash)
    end

    it '.search_location' do

    end

    it '.location_name' do

    end
  end 
end 