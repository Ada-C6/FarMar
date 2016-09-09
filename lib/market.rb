module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    attr_accessor :list_of_markets

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      list_of_markets = []
      CSV.read("/Users/YNaka/Ada/project_forks/FarMar/support/markets.csv", "r").each do |line|
        list_of_markets << self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
      end
      list_of_markets
    end

    def self.find(market_id)
      Market.all.each do |m|
        if market_id == m.id
          return m
        end
      end
      return "That is not an existing market ID"
    end

    def vendors
      this_markets_vendors = []
      FarMar::Vendor.all.each do |v|
        if @id == v.market_id
           this_markets_vendors << v.name
        end
      end
      return this_markets_vendors
    end

  end
end
