require_relative '../farmar'
require_relative 'spec_helper'

describe "Testing FarMar" do

  it "Testing to see if I can create a new instance of vendors" do
  test1 = FarMar::Vendors.new
  expect(test1).wont_be_nil(true)
  end

end
