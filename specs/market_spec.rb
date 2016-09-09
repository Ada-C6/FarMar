require_relative 'spec_helper'
module FarMar

  describe Market do
    describe "#initialize" do
      let(:market) { Market.new(:id, :name, :address, :city, :county, :state, :zipcode) }

      it "can create an instance of Market" do
        market.must_be_instance_of(Market)
      end
      it "must respond to (have parameters of) of market information" do
        market.must_respond_to(:id)
        market.must_respond_to(:name)
        market.must_respond_to(:address)
        market.must_respond_to(:city)
        market.must_respond_to(:county)
        market.must_respond_to(:state)
        market.must_respond_to(:zipcode)
      end
    end

    describe "#self.all" do

      it "should return a hash" do
        Market.all.must_be_instance_of(Hash)
      end
      it "should return information about markets" do
        # first listed market
        Market.all[1].id.must_equal(1)
        Market.all[1].name.must_equal("People's Co-op Farmers Market")
        Market.all[1].address.must_equal("30th and Burnside")
        Market.all[1].city.must_equal("Portland")
        Market.all[1].county.must_equal("Multnomah")
        Market.all[1].state.must_equal("Oregon")
        Market.all[1].zipcode.must_equal("97202")
        # last listed market
        Market.all[500].id.must_equal(500)
        Market.all[500].name.must_equal("Montefiore Medical Center Farmers Market_Thursday")
        Market.all[500].address.must_equal("111 E. 210th Street")
        Market.all[500].city.must_equal("Bronx")
        Market.all[500].county.must_equal("Bronx")
        Market.all[500].state.must_equal("New York")
        Market.all[500].zipcode.must_equal("10467")
      end

      it "should be a collection of Market objects" do
        Market.all.each do |market_id, market|
          market_id.must_equal(market.id) # shows it's pairing up correctly
          market.must_be_instance_of(Market) # shows the value objects are market instances
        end
      end
    end #self.all
    describe "#self.find(id)" do
      it "should return an instance of a Market object of a certain id" do
        random_market_id = rand(1..500)
        Market.find(random_market_id).must_be_instance_of(Market)
        Market.find(random_market_id).id.must_equal(random_market_id)
      end
    end #self.find(id)

    describe "#vendors" do
      it "should request vendors associated with itself (its instance of Market)" do
        all_markets = Market.all
        random_market_id = rand(1..500)
        random_market = all_markets[random_market_id]
        random_market.vendors.each do |vendor_id, vendor|
          vendor.market_id.must_equal(random_market_id)
        end
      end
    end #vendors

  end #market


end #module
