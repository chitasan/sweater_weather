class RoadTripForecasts
  attr_reader :city,
              :state

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    city_state = destination.split(',')
    @city = city_state[0]
    @state = city_state[1]
    @latitude = get_latitude
    @longitude = get_longitude
    @location = location
  end

  def get_destination_arrival_weather
    get_destination_weather.last
  end 

  private

  def time
    split_time = time_to_destination.split(' ')
    (split_time[0] + '.' + split_time[2]).to_f.ceil
  end 

  def get_destination_weather
    JSON.parse(@location.hourly_weathers.hourly_weather_info, symbolize_names: true) 
  end
  
  def location
    Location.find_or_create_by(city: city, state: state) do |location|
      location.hourly_weathers = HourlyWeathers.create(hourly_weather_info: weather.weather_hours(time).to_json)
    end 
  end 
  
  def weather
    @weather ||= Weather.new(@latitude, @longitude)
  end

  def get_latitude
    @latitude ||= location_service.get_latitude
  end
  
  def get_longitude
    @longitude ||= location_service.get_longitude
  end

  def location_service
    @location_service ||= LocationService.new(city, state)
  end

  def time_to_destination
    road_trip_service.get_time
  end 

  def road_trip_service
    RoadTripService.new(@origin, @destination)
  end 
end