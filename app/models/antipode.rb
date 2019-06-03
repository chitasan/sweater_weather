class Antipode
  attr_reader :city, :state

  def initialize(city_state)
    split_location = city_state.split(',')
    @city          = split_location[0]
    @state         = split_location[1]
    @latitude      = get_antipode_lat
    @longitude     = get_antipode_long
  end

  def forecast
    {
      summary: weather[:currently][:summary],
      current_temperature: weather[:currently][:temperature]
    }
  end

  def search_location 
    @city
  end

  def location_name #antipode city name
     get_city
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

  def get_city
    @city ||= reverse_geocode_service.get_city
  end

  def get_state
    @state ||= reverse_geocode_service.get_state
  end 

  def reverse_geocode_service
    @reverse_geocode_service ||= ReverseGeocodeService.new(@latitude, @longitude)
  end

  def weather
    @weather ||= Weather.new(@latitude, @longitude)
  end

  def get_date
    Time.now.strftime('%Y-%m-%d')
  end
end