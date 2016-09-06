require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do

    it "can create a new instance of Market" do
      FarMar::Market.new.must_be_instance_of(FarMar::Market)
    end
  end

end
