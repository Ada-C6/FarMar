require_relative '../farmar'
require_relative 'spec_helper'

describe "Testing FarMar" do

  it "Testing to see if I can create a new instance of products" do
  test1 = FarMar::Products.new
  expect(test1).wont_be_nil(true)
  end

end
