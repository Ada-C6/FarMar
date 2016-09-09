module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip, :vendors_at_market

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address= address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end #end initialize method

    def self.all
      markets_hash = {}
      CSV.read("support/markets.csv").each do |line|
        id = line[0].to_i
        name = line[1]
        address = line[2]
        city = line[3]
        county = line[4]
        state = line[5]
        zip = line[6]
        markets_hash[id] = self.new(id, name, address, city, county, state, zip)
      end
      return markets_hash
    end

    def self.find(id)
      return self.all[id]
    end

    def vendors
      FarMar::Vendor.by_market(@id)
    end #end vendors method
  end
end
