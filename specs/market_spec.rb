require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do
    greenlake = FarMar::Market.new(123)

    it "should create a new instance" do
      greenlake.must_be_instance_of(FarMar::Market)
    end
  end
end
