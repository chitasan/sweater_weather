class Api::V1::RoadTripController < ApplicationController
  def show
    forecast = RoadTripForecasts.new(params[:start], params[:end])
    render json: RoadTripForecastsSerializer.new(forecast)
  end
end 