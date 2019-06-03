class Antipode
  attr_reader :city, :state

  def initialize(city_state)
    split_location = city_state.split(',')
    @city          = split_location[0]
    @state         = split_location[1]
    @latitude      = get_antipode_lat
    @longitude     = get_antipode_long

  end

  
  
  private

  def get_antipode_lat
    @latitude ||= antipode_service.get_lat
  end
  
  def get_antipode_long
    @longitude ||= antipode_service.get_long
  end 

  def antipode_service
    @antipode_service ||= AntipodeService.new(@city, @state)
  end

  def city
    @city ||= reverse_geocode_service.get_city
  end

  def state
    @state ||= reverse_geocode_service.get_state
  end 

  def reverse_geocode_service
    @reverse_geocode_service ||= ReverseGeocodeService.new(@latitude, @longitude)
  end 
end

