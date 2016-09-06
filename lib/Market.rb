require 'CSV'
# require_relative '../support/markets.csv'
require_relative '../far_mar'
module FarMar
  class Market

  def initialize(name)
    @name = name

  end



  end


end


#model for reading CSV files
#   def self.all
#   accounts = []
#   CSV.read("./support/accounts.csv").each do |line|
#     accounts_hash = {}
#     accounts_hash[:id] = line[0].to_i
#     accounts_hash[:balance] = line[1].to_f/100
#     accounts_hash[:account_open_date] = line[2]
#     accounts << Bank::Account.new(accounts_hash)
#   end
#   return accounts
# end
