require 'rails_helper'

RSpec.describe 'airline show page' do

  it 'displays unique list of adult passengers' do
    airline = Airline.create!(name: "United")
    flight1 = airline.flights.create!(number: 458, date: "02/12/2021", departure_city: "Denver", arrival_city: "Little Rock")
    flight2 = airline.flights.create!(number: 1445, date: "08/14/2021", departure_city: "Anchorage", arrival_city: "Seattle")
    passenger1 = flight1.passengers.create!(name: "Jason", age: 56)
    passenger2 = flight1.passengers.create!(name: "Sal", age: 27)
    passenger3 = flight2.passengers.create!(name: "Ryan", age: 30)
    passenger4 = flight2.passengers.create!(name: "Freddy", age: 15)

    visit "/airlines/#{airline.id}"
    expect(page).to have_content(passenger1.name)
    expect(page).to have_content(passenger2.name)
    expect(page).to have_content(passenger3.name)

    expect(page).to_not have_content(passenger4.name)
  end
end
