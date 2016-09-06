# lib/farmar_market.rb
# require_relative '../far_mar'

class FarMar::Market
  attr_reader :id
  def initialize(id, name, address, city, county, state, zip)
     @id = id
     @name = name
     @address = address
     @city = city
     @county = county
     @state = state
     @zip = zip
  end

  # load market infomation from market csv file
  # input: csv file name (optional)
  # output: an array of class Market objects
  def self.all
    market_csv_file = "/Users/mengyao/ADA_class/FarMar/support/markets.csv"

    markets = []
    CSV.foreach(market_csv_file) do |row|
      id = row[0].to_s
      name = row[1].to_s
      address =row[2].to_s
      city = row[3].to_s
      county = row[4].to_s
      state = row[5].to_s
      zip = row[6].to_s
      markets << FarMar::Market.new(id, name, address, city, county, state, zip)
    end
    return markets
  end

  # identify market information by market id
  # input: market id (string)
  # output: an market object that corresponds to the given market id
  def self.find(id)
    found_market = nil
    all.each do |market|
      if id == market.id
        found_market = market
        break
      end
    end
    return found_market
  end
end
