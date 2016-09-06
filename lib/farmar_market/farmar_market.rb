require 'csv'

# lib/farmar_market/farmar_market.rb
module FarMar
  class Market

    attr_reader :market_csv

    def initialize
      @market_csv = CSV.read("../FarMar/support/markets.csv", "r")
    end

  end
end


market = FarMar::Market.new
puts market.market_csv
