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

    def vendors
      market_vendors = []
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor|
        if vendor.market_id == @id
          market_vendors << vendor
        end
      end
      return market_vendors
    end

    def self.search(search_term)
      all_markets = self.all
      all_vendors = FarMar::Vendor.all

      matching_market_names = all_markets.select do |market|
        market.name.upcase.include?(search_term.upcase)
      end

      # matching_vendor_name_markets = [] stalls in terminal
      # all_vendors.each do |vendor|
      #   if vendor.name.upcase.include?(search_term.upcase)
      #     matching_vendor_name_markets << FarMar::Market.find(vendor.market_id)
      #   end
      # end
      matching_vendors = all_vendors.select do |vendor|
        vendor.name.upcase.include?(search_term.upcase)
      end

      matching_vendor_name_markets = matching_vendors.map do |vendor|
        FarMar::Market.find(vendor.market_id)
      end

      matching_markets = matching_market_names + matching_vendor_name_markets

      return matching_markets.uniq
    end

    def products
      market_products = []
      vendors.each do |vendor|
        market_products += vendor.products
      end
      return market_products
    end

    def preferred_vendor(date = nil) # use default/optional date?
      if date == nil
        preferred_vendor = vendors.max_by do |vendor|
          vendor.revenue
        end
        return preferred_vendor
      else
        beginning_time = DateTime.new(date.year, date.month, date.day, 0, 0, 0, '-8')
        end_time = DateTime.new(date.year, date.month, date.day, 23, 59, 59, '-8')

        sales = FarMar::Sale.between(beginning_time, end_time)

        sales.preferred_vendor
      end
    end

    # def preferred_vendor_by_date(date)
    #   beginning_time = DateTime.new(date.year, date.month, date.day, 0, 0, 0, '-8')
    #   end_time = DateTime.new(date.year, date.month, date.day, 23, 59, 59, '-8')
    #
    #   sales = FarMar::Sale.between(beginning_time, end_time)
    #
    #   sales.preferred_vendor
    # end

  end
end
