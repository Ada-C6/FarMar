require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :address
    def initialize (id, name, address, city, county, state, zip)
      # ID - (Fixnum) a unique identifier for that market
      @id = id
      # Name - (String) the name of the market (not guaranteed unique)
      @name = name
      # Address - (String) street address of the market
      @address = address
      # City - (String) city in which the market is located
      # County - (String) county in which the market is located
      # State - (String) state in which the market is located
      # Zip - (String) zipcode in which the market is located)
    end

    def self.all
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      markets = {}

      CSV.read("support/markets.csv").each do |line|
        # Is there a way to do this with an enumerable instead of an each?
        # id = line[0].to_i
        # name = line[1]
        # address = line[2]
        # city = line[3]
        # county = line[4]
        # state = line[5]
        # zip = line[6].to_i

        id, name, address, city, county, state, zip = line # parallel assignment!
        id = id.to_i # need id to be a fixnum
        zip = zip.to_i # want zip to be a fixnum also (I think)

        markets[id] = self.new(id, name, address, city, county, state, zip)
      end

      return markets
    end

    def self.find(id)
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      all_markets = self.all
      return all_markets[id]
    end

    def vendors
      Vendor.all.values.group_by { |vendor| vendor.market_id }[@id]
      # Call Vendor.all (returns a hash of vendors)
      # The Vaules of the Vendor.all hash is an array of Vendors, so want to group those on their market_id.
      # Then, want only the vendors that correspond to the market instance's id.
    end
  end
end


# This is what I wrote for the accounts self.all to read in the csv file.
# def self.all
#   accounts = {}
#
#   CSV.read("support/accounts.csv").each do |line|
#     account_id = line[0].to_i
#     balance = line[1].to_i
#     open_date = line[2]
#     accounts[account_id] = self.new(account_id, open_date, balance)
#   end
#
#   return accounts
# end
