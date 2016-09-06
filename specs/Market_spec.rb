require_relative 'spec_helper.rb'
require_relative '../lib/Market.rb'

# copied shamelessy and without remorse from Scrabble

describe "Testing Market Class" do
  
  it "Tests that the instatiation of the Market class requires EXACTLY one arugment" do
    # TODO this is a bogous test fix it
    expect( proc {FarMar::Market.new("One").must_be_kind_of(FarMar::Market)})
    expect( proc {FarMar::Market.new}).must_raise(ArgumentError)
    expect( proc {FarMar::Market.new("One", "Two")}).must_raise(ArgumentError)
  end
end