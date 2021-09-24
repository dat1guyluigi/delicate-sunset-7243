require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
    it {should have_many(:passengers).through(:flights)}
  end

  describe 'instance methods' do
    it 'returns a unique list of passengers over 18' do
    airline = Airline.create!(name: "United")
    flight1 = airline.flights.create!(number: 458, date: "02/12/2021", departure_city: "Denver", arrival_city: "Little Rock")
    flight2 = airline.flights.create!(number: 1445, date: "08/14/2021", departure_city: "Anchorage", arrival_city: "Seattle")
    passenger1 = flight1.passengers.create!(name: "Fernando", age: 56)
    passenger2 = flight1.passengers.create!(name: "Luis", age: 27)
    passenger3 = flight2.passengers.create!(name: "Gerardo", age: 30)
    passenger4 = flight2.passengers.create!(name: "Francisco", age: 15)

    expect(airline.adult_passengers).to eq([passenger1, passenger2, passenger3])
  end
  end
end
