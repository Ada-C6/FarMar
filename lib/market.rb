require 'csv'

module FarMar
  class Market
    attr_reader
    attr_accessor
    attr_writer

    def initialize() #(account_hash)
      # @balance = account_hash[:balance]
      # @id = account_hash[:id]
      # @creation_time = account_hash[:creation_time]
      # create_account(account_hash[:balance])
    end

    # def self.all
    #   accounts = []
    #   CSV.read("./support/accounts.csv").each do |line|
    #     account_hash = {}
    #     account_hash[:id] = line[0].to_i
    #     account_hash[:balance] = line[1].to_f
    #     account_hash[:creation_time] = line[2]
    #     accounts << Bank::Account.new(account_hash)
    #   end
    #   return accounts
    # end

  end
end
