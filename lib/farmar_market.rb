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
      self.all.find do |market|
        market.id == id
      end
    end


    def self.find_by_name(name)
      self.all.find do |market|
        market.name.upcase == name.upcase
      end
    end

    # def self.find_all_by_state(state)
    #   state_markets = self.all.select do |market|
    #     market.state.upcase == state.upcase
    #   end
    #   return state_markets
    # end

    def vendors
      FarMar::Vendor.all.select do |vendor|
        vendor.market_id == @id
      end
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
      else
        preferred_vendor = vendors.max_by do |vendor|
          vendor.revenue(date)
        end
      end
      return preferred_vendor
    end

    def worst_vendor(date = nil)
      if date == nil
        preferred_vendor = vendors.min_by do |vendor|
          vendor.revenue
        end
      else
        preferred_vendor = vendors.min_by do |vendor|
          vendor.revenue(date)
        end
      end
      return preferred_vendor
    end

  end
end
