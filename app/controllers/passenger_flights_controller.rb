class PassengerFlightsController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    flight.passengers.destroy(params[:id])

    redirect_to flights_path
  end
end
