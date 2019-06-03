class Antipode
  attr_reader :origin_city,
              :antipode_city,
              :latitude,
              :longitude

  def initialize(city_state)
    split_location = city_state.split(',')
    @origin_city   = split_location[0]
    @origin_state  = split_location[1]
    @antipode_city = get_city
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
    @origin_city
  end

  def location_name #antipode city name
    @antipode_city
  end

  private

  def location
    # ReverseGeocode.find_or_create_by(latitude: , longitude: ) do |location|
  end 

  def get_antipode_lat
    antipode_service.get_lat
  end
  
  def get_antipode_long
    antipode_service.get_long
  end 

  def antipode_service
    AntipodeService.new(@latitude, @longitude)
  end

  def get_city
    reverse_geocode_service.get_city
  end

  def reverse_geocode_service
    @reverse_geocode_service ||= ReverseGeocodeService.new(@latitude, @longitude)
  end

  def weather
    @weather ||= Weather.new(@latitude, @longitude)
  end
end