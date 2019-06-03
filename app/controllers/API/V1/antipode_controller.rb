class Api::V1::AntipodeController < ApplicationController
  def show
    location = Antipode.new(params[:loc])
    render json: AntipodeSerializer.new(location)
  end
end