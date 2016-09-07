#need to access the csv 'markets', retrieve instances of market + create new instances
require 'csv'
module FarMar

  class Market
    attr_accessor :id, :name, :city
    def initialize(id)
      @id = id
      #@name = name
      #@street = street
      #@city = city
      #@county = county
      #@state = state
      #@zip = zip
    end

    def self.all
    mkt =  {}

      CSV.read('../support/markets.csv').each do |line|
      @id = (line[0])
      mkt.line[@id] = line[1..line.length]

          #self.new = all
              #self.new line[1..line.length]
        puts all
      end
      return mkt
    end
  end
end

puts FarMar::Market.all
