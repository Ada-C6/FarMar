require 'csv'

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
    end
end
