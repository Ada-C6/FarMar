require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :state
  def initialize (id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

def self.all
  markets = {}
  farm_mrkt = []
  CSV.open('support/markets.csv', 'r'). each do |place|
    markets[place[0]] = place[1..6]
    id = place[0].to_i
    name = place[1]
    address = place[2]
    city = place[3]
    county = place[4]
    state = place[5]
    zip = place[6]
    farm_mrkt << self.new(id, name, address, city, county, state, zip)
  end
  return farm_mrkt
end
def self.find(id)
  id_find = self.all
  id_find.each do |i|
    if i.id == id
      return i
    end
  end
end
def vendors
  FarMar::Vendor.by_market(@id)
end
  end
end
