module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zipcode

    def initialize(id, name, address, city, county, state, zipcode)
      @id         = id
      @name       = name
      @address    = address
      @city       = city
      @county     = county
      @state      = state
      @zipcode    = zipcode
    end

    def self.all
      markets = {}
      CSV.read('support/markets.csv').each do |line|
        market = self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
        markets[market.id] = market
      end
      return markets
    end
    def self.find(id)
      markets = self.all
      return markets[id]
    end


  end
end

# # From BANK ACCOUNT PROJECT
#
# # Method returns an instance of Account where the value of the id field in the CSV matches the passed parameter
# def self.find(id)
#   accounts = self.all
#   return accounts[id]
# end
