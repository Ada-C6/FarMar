# require 'csv'
# require_relative 'vendor'

module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zip #,:vendor_info

    def initialize (id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
      # @vendor_info = []
    end

    def self.all
      info = {}
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


    #use map
    def vendors
      return FarMar::Vendor.by_market(@id)
    end
  end
end






  #   CSV.read('support/accounts.csv').each do |line|
  #     id = line[0].to_i
  #     balance = line[1].to_i
  #     open_date = line[2].to_i
  #     #arrays of arrays
  #     account_info<< self.new(id, balance, open_date)
  #   end
  #   return account_info

  # c = FarMar.find(1)

  # c = FarMar::Market.new(3, "name", "address", "city", "county", "state", 8880)
  # p c.vendors

  # p FarMar::Market.all
