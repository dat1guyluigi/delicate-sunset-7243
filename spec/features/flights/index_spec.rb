require 'rails_helper'

RSpec.describe 'flights index page' do
  before(:each) do
    @airline = Airline.create!(name: "United")
    @flight1 = @airline.flights.create!(number: 458, date: "02/12/2021", departure_city: "Denver", arrival_city: "Little Rock")
    @flight2 = @airline.flights.create!(number: 1445, date: "08/14/2021", departure_city: "Anchorage", arrival_city: "Seattle")
    @passenger1 = @flight1.passengers.create!(name: "John", age: 56)
    @passenger2 = @flight1.passengers.create!(name: "Sarah", age: 27)
    @passenger3 = @flight2.passengers.create!(name: "Jessica", age: 30)
    @passenger4 = @flight2.passengers.create!(name: "Tony", age: 20)

    visit flights_path
  end

  it 'displays all flight numbers' do
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
  end

  it 'displays each airline name' do
    expect(page).to have_content(@airline.name)
  end

  it 'displays all of the flights passengers' do
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)
  end

  it 'has a link to remove a passenger' do
    #save_and_open_page
    click_link "Remove #{@passenger1.name}"
    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(@passenger1.name)
  end
end
