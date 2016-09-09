# require 'csv'
# require_relative 'vendor'

module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zip

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
      info = {}
      # CSV.read('../support/markets.csv').each do |line|
        CSV.read('support/markets.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        address = line[2]
        city = line[3]
        county = line[4]
        state = line[5]
        zip = line[6]
        info[id] = self.new(id, name, address, city, county, state, zip)
      end
      return info
    end

    def self.find(id)
      self.all[id]
    end

    def vendors
     vendor_info = FarMar::Vendor.by_market(@id)
     return vendor_info
    end
  end
end


  # # c = FarMar.find(1)
  #
  # c = FarMar::Market.new(3, "name", "address", "city", "county", "state", 8880)
  # p c.vendors
  #
  # # p FarMar::Market.all
