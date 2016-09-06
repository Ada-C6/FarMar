require_relative '../farmar'
require_relative 'spec_helper'

describe "Testing FarMar" do

  it "Testing to see if I can create a new instance of sales" do
  test1 = FarMar::Sales.new
  expect(test1).wont_be_nil(true)
  end

end
