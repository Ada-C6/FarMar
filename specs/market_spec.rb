require_relative 'spec_helper'

describe FarMar::Market do
  describe "#initialize" do

    it "should create a new instance of Market" do
      pvd_market = FarMar::Market.new(101, "PVD", "139 Raindrop Road", "Providence", "PVD", "RI", "02888")
      pvd_market.must_be_instance_of(FarMar::Market)
    end

    # it "should have a name property" do
    #   sea_market = FarMar::Market.new
    #   sea_market.must_respond_to(:name)
    # end
    #
    # it "should have an address property" do
    #   sea_market = FarMar::Market.new
    #   sea_market.must_respond_to(:address)
    # end
    #
    # it "should have a city property" do
    #   sea_market = FarMar::Market.new
    #   sea_market.must_respond_to(:county)
    # end

    # Tests for Market properties
    it "should have an ID property" do
      sea_market = FarMar::Market.new(1010, "SEA", "139 Raindrop Road", "Seattle", "X", "WA", "98109")
      sea_market.must_respond_to(:id)
    end

    it "should have an id that is the same value that we set" do
      nyc_market = FarMar::Market.new(10101, "NYC", "139 Raindrop Road", "New York", "X", "NY", "23422")
      nyc_market.id.must_equal(10101)
    end

    it "should have a name that is the same value that we set" do
      ist_market = FarMar::Market.new(101010, "IST", "139 Raindrop Road", "Istanbul", "BEY", "TU", "23429")
      ist_market.name.must_equal("IST")
    end

    it "should have an address that is the same value that we set" do
      lax_market = FarMar::Market.new(1010101, "LAX", "139 Raindrop Road", "Los Angeles", "LA", "CA", "23429")
      lax_market.address.must_equal("139 Raindrop Road")
    end

    it "should have a city that is the same value that we set" do
      mot_market = FarMar::Market.new(1010101, "MOT", "139 Raindrop Road", "Montreal", "X", "CN", "23429")
      mot_market.city.must_equal("Montreal")
    end

    it "should have a county that is the same value that we set" do
      knx_market = FarMar::Market.new(1010101, "LAX", "139 Raindrop Road", "Knoxville", "Knox", "TN", "37922")
      knx_market.county.must_equal("Knox")
    end

    it "should have a state that is the same value that we set" do
      knx_market = FarMar::Market.new(1010101, "LAX", "139 Raindrop Road", "Knoxville", "Knox", "TN", "37922")
      knx_market.state.must_equal("TN")
    end

    it "should have a zip that is the same value that we set" do
      knx_market = FarMar::Market.new(1010101, "LAX", "139 Raindrop Road", "Knoxville", "Knox", "TN", "37922")
      knx_market.zip.must_equal("37922")
    end
  end

  describe "self.all" do

    it "should return an array" do
      FarMar::Market.all.must_be_kind_of(Array)
    end

    it "should return an array of 500 elements" do
      market_array = FarMar::Market.all
      market_array.length.must_equal(500)
    end
  end

  describe "self.find" do
    it "should return an object" do
      FarMar::Market.find(1).must_be_kind_of(FarMar::Market)
    end

    it "should return an object whose id matches the id passed into the parameter" do
      FarMar::Market.find(2).id.to_i.must_equal(2)
    end
  end

  describe "#vendors" do
    before (:each) do
      @market_one = FarMar::Market.new(1, "People's Co-op Farmers Market",	"30th
      and Burnside", "Portland", "Multnomah", "Oregon", 97202)
    end

    it "should return an array" do
      @market_one.vendors.must_be_kind_of(Array)
    end

    it "should return an array of vendors whose market_ids match that of the market instance" do
      @market_one.vendors.each do |vendor|
        vendor.market_id.to_i.must_equal(1)
      end
    end
  end




end
