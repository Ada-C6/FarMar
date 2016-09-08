module FarMar
  class Market
    attr_reader :id, :name, :state

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      all_markets = []
      CSV.read('support/markets.csv').each do |line|
        all_markets << FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
      end
      return all_markets
    end

    def self.find(id)
      all_markets = self.all
      all_markets.each do |market|
        if market.id == id
          return market
        end
      end
    end

    def self.find_by_name(name)
      all_markets = self.all
      all_markets.each do |market|
        if market.name.upcase == name.upcase
          return market
        end
      end
    end

    def self.find_all_by_state(state)
      all_markets = self.all
      state_markets = all_markets.select do |market|
        market.state.upcase == state.upcase
      end
      return state_markets
    end

    def market
      market_vendors = []
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor|
        if vendor.market_id == @id
          market_vendors << vendor
        end
      end
      return market_vendors
    end

  end
end
