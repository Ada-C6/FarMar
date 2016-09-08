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
      self.all.find do |vendor|
        vendor.id == num
      end
    end

    def market
      FarMar::Market.find(@market_id)
    end

    def self.by_market(market_id)
      vendors = []
      CSV.open('./support/vendors.csv', 'r').each do |line|

        if line[3].to_i == market_id
        vendors << FarMar::Vendor.new({id:line[0],
        name:line[1],
        employees:line[2],
        market_id:line[3]})
        end
      end
      return vendors
    end

    def products
      return FarMar::Product.by_vendor(@id)
    end

    def sales
      sales = []
      CSV.open('./support/sales.csv', 'r').each do |line|

        if line[3].to_i == @id
        sales << FarMar::Sale.new({id:line[0],
        amount:line[1],
        purchase_time:line[2],
        vendor_id:line[3],
        product_id:line[4]})
        end
      end
      return sales

    end

  end
end
