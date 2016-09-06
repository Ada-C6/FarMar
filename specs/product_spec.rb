require_relative 'spec_helper'

describe FarMar::Product do

describe "#initialize" do
  it "can create a new instance of Product" do
    sam = FarMar::Product.new(19, "Jane", 81)
    sam.must_be_instance_of(FarMar::Product)
  end
end

end
