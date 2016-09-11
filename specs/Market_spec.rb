require_relative 'spec_helper.rb'
require_relative '../far_mar.rb'


# copied shamelessy and without remorse from Scrabble

describe "Testing market" do
  # test for the self.all method
  it "creates a new instance of Market" do

    id = 4
    name = "Nada Whole Fudz"
    address = "1215 Harry Hines Blvd"
    city = "Portland"
    county = "King"
    state = "Washington"
    zip_code = 98101

    new_market1 = FarMar::Market.new(id, name, address, city, county, state, zip_code)

    new_market1.id.must_equal id
    new_market1.name.must_equal name
    new_market1.address.must_equal address
    new_market1.city.must_equal city
    new_market1.county.must_equal county
    new_market1.state.must_equal state
    new_market1.zip_code.must_equal 98101
    
  end

  it "Tests that we can call self.all " do
    new_market_array = FarMar::Market.all
    new_market_array.must_be_kind_of Array
    new_market_array[0].must_be_kind_of FarMar::Market

  end

  it "Tests that the object number == the CSV array length" do
    # returns an array of an array of strings
    new_market_array = FarMar::Market.all
    csv_array_array = CSV.read('./support/markets.csv')
    csv_array_array.length.must_equal new_market_array.length
  end

  # testing the self.find methods

  it "Tests that the id parameter returns a matching market id" do
    new_market = FarMar::Market.find('474')
    new_market.must_be_kind_of FarMar::Market
    new_market.id.must_equal '474'
  end

  it "Tests that the method returns nil if no match for market id found" do
    new_market = FarMar::Market.find('501')
    new_market.must_equal nil

  end





  
end