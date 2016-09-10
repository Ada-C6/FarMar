module FarMar
    class Market
        attr_reader :id, :name, :address, :city, :county, :state, :zip

        def initialize(id, name, address, city, county, state, zip)
            @id = id # (Fixnum) a unique identifier for that market
            @name = name # (String) the name of the market (not guaranteed unique)
            @address = address # (String) street address of the market
            @city = city # (String) city in which the market is located
            @county = county # (String) county in which the market is located
            @state = state # ((String) state in which the market is located
            @zip = zip # (String) zipcode in which the market is located
        end

        def self.all
            market_list = []

            market_file = CSV.read('/Users/kelly/Desktop/Ada_C6/FarMar/support/markets.csv', 'r')
            market_file.each do |line|
                market_list << self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
            end

            return market_list
        end

        def self.find(id)
            self.all.each do |item|
                if item.id == id
                    return item
                end
            end
            puts "Sorry, invalid Market ID"
            return nil
        end

        #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
        def vendors
            vendor_list = FarMar::Vendor.all
            vendor_by_market_id = vendor_list.select {|item| item.market_id == @id }
            return vendor_by_market_id
        end
    end
end
