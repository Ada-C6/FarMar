module FarMar
  class Market
    attr_reader :id, :name

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

  end
end
