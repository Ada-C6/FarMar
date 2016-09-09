require 'csv'
require_relative 'vendor'
module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip, :vendors

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
      @vendors = []
    end

    def self.load_all
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

    def self.all
      @@all_markets ||= self.load_all
      return @@all_markets
    end

    def self.find(id)
      return self.all[id]
    end

    def vendors
      FarMar::Vendor.by_market(@id)
    end

    def products
      mkt_vendors = FarMar::Vendor.by_market(@id)
      all_products = []
      mkt_vendors.each do |val, vendor|
        vendor.products.each do |product|
          all_products << product
        end
      end
      return all_products
    end

    def self.search(search_term)
      mkts = []

      all_markets = FarMar::Market.all
      all_markets.each do |val, market|
        if market.name.downcase.include?(search_term)
          mkts << market
        end
      end
      
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |val, vendor|
        if vendor.name.downcase.include?(search_term)
          mkt << vendor.market
        end
      end
      return mkts
    end

  end
end
