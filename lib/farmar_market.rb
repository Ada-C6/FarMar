class FarMar::Market

    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    # ID - (Fixnum) a unique identifier for that market
    # Name - (String) the name of the market (not guaranteed unique)
    # Address - (String) street address of the market
    # City - (String) city in which the market is located
    # County - (String) county in which the market is located
    # State - (String) state in which the market is located
    # Zip - (String) zipcode in which the market is located
    def initialize(market_info_hash)
        @id = market_info_hash[:id]
        @name = market_info_hash[:name]
        @address = market_info_hash[:address]
        @city = market_info_hash[:city]
        @county = market_info_hash[:county]
        @state = market_info_hash[:state]
        @zip = market_info_hash[:zip]
    end #initialize

    def self.all
        all_markets = {}
        CSV.read('support/markets.csv').each do |line|
            new_market_info_hash = {
                id: line[0].to_i,
                name: line[1],
                address: line[2],
                city: line[3],
                county: line[4],
                state: line[5],
                zip: line[6]
            }

            all_markets[line[0].to_i] = self.new(new_market_info_hash)
        end # CSV.open

        return all_markets
    end # self.all

    def self.find(id)
        return self.all[id]
    end # self.find

end # FarMar::Market
