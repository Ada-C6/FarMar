require 'csv'

module FarMar
  class Market
    def initialize (id, name, address, city, county, state, zip)
      # ID - (Fixnum) a unique identifier for that market
      # Name - (String) the name of the market (not guaranteed unique)
      # Address - (String) street address of the market
      # City - (String) city in which the market is located
      # County - (String) county in which the market is located
      # State - (String) state in which the market is located
      # Zip - (String) zipcode in which the market is located)
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
