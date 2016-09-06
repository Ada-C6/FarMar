require_relative 'spec_helper'


describe FarMar::Market do
  describe "#initialize" do
    it "can create a new instance of Market" do
      cap_hill = FarMar::Market.new( 123, "Judy", "723 Herman ave", "Skokie", "Cook", "Il", "60076")
      cap_hill.must_be_instance_of(FarMar::Market)
    end

    it "should have an id property" do
      cap_hill = FarMar::Market.new( 123, "Judy", "723 Herman ave", "Skokie", "Cook", "Il", "60076")
      cap_hill.must_respond_to(:id)
    end

  end

end
