require 'csv'

class Market

  attr_accessor :market_hash, :id, :name, :city, :county, :state, :zip

  def initialize
  end

  # def initialize(id, name, address, city, county, state, zip)
  #   @id = id
  #   @name = name
  #   @city = city
  #   @county = county
  #   @state = state
  #   @zip = zip
  # end

  # def self.all
  #   markets = {}
  #   CSV.read('../support/markets.csv').each do |line|
  #     markets = self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
  #     # markets = {(line[0].to_i): name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]}
  #     # )
  #   end
  # end

end
