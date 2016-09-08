# require 'csv'
# require_relative 'farmar_market'

module FarMar
  class Vendor
    attr_reader :id, :name, :employees, :market_id

    def initialize(vendor_hash)

      @id = vendor_hash[:id]
      @name = vendor_hash[:name]
      @employees = vendor_hash[:employees]
      @market_id = vendor_hash[:market_id]

    end

    def self.all
      CSV.open('./support/vendors.csv', 'r').map do |line|
      self.new({id: line[0].to_i,
        name: line[1],
        employees:line[2].to_i,
        market_id: line[3].to_i
      })
      end
    end

    def self.find(num)
      self.all.find {|vendor| vendor.id == num}
    end

    def market
      FarMar::Market.find(@market_id)
    end

    def self.by_market(market_id)
      self.all.select{|vendor| vendor.market_id == market_id}
    end

    def products
      return FarMar::Product.by_vendor(@id)
    end

    def sales
      FarMar::Sale.all.select {|sale| sale.vendor_id == @id}
    end

    def revenue
        sales.map(&:amount).reduce(:+)
    end

  end
end
