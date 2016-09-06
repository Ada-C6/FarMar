require 'csv'


module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip


    end

  end
end
