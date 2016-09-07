#need to access the csv 'markets', retrieve instances of market + create new instances
require 'csv'
module FarMar

  class Market
    attr_accessor :id, :name, :city
    def initialize(id, name, street, city, county, state, zip)
      @id = id
      @name = name
      @street = street
      @city = city
      @county = county
      @state = state
      @zip = zip
      @all = all

    end

    def compile
      @all = {:id => @id, :name => @name, :street => @street , :city => @city, :county => @county, :state => @state, :zip => @zip}
        return @all
    end

    def self.all
      mkt =  {}

        CSV.read('../support/markets.csv').each do |line|
        mkt[line[0]] = line[1..line.length]
          puts mkt
      end
        return mkt
    end
  end


end
#FarMar::Market.new("9999999", "Natasha", "737 Olive Way", "Seattle", "King", "WA", "98101")

  puts FarMar::Market.all
