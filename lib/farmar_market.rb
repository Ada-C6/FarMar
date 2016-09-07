require 'csv'

class Market

  attr_reader :id, :name, :city, :county, :state, :zip

  def initialize(id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    markets = {}
    CSV.read('../support/markets.csv').each do |line|
      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6]

      markets[id] = self.new(id, name, address, city, county, state, zip)
    end
    return markets
  end

  def self.find(id)
    markets = Market.all
    return markets[id]
  end

end
