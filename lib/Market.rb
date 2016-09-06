require 'CSV'
module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county
  # def initialize(name)
  #   @name = name
  #
  # end
  def initialize(markets_hash)
      @id = markets_hash[:id]
      @name = markets_hash[:name]
      @address= markets_hash[:address]
      @city = markets_hash[:city]
      @county = markets_hash[:county]
      @state = markets_hash[:state]
      @zip = markets_hash[:zip]

  end #end initialize method

  def self.all
    markets = []
    CSV.read("./support/markets.csv").each do |line|
      markets_hash = {}
      markets_hash[:id] = line[0].to_i
      markets_hash[:name] = line[1]
      markets_hash[:address] = line[2]
      markets_hash[:city] = line[3]
      markets_hash[:county] = line[4]
      markets_hash[:state] = line[5]
      markets_hash[:zip] = line[6]
      markets << FarMar::Market.new(markets_hash)
    end
    return markets
  end

  def self.find(id)
      self.all.each do |market|
        if market.id == id
          return market
        end
      end
  end


  end


end
