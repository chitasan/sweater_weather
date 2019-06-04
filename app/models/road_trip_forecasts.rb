class RoadTripForecasts
  attr_reader :city,
              :state

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    city_state = destination.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
  end


  private

  def time_to_destination
    service.get_time
  end 

  def service
    RoadTripService.new(origin, destination)
  end 
end