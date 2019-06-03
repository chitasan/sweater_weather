class Antipode
  attr_reader :city, :state

  def initialize(city_state)
    split_location = city_state.split(',')
    @city          = split_location[0]
    @state         = split_location[1]
  end 
end 