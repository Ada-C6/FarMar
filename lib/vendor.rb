require 'csv'
module FarMar

  class Vendor
    attr_accessor :market_id, :id, :name, :employees
      def initialize(market_id, id, name, employees)
        @market_id = market_id
        @id = id
        @name = name
        @employees = employees
      end

      def self.all
        vendors = { }
          CSV.read('../support/vendors.csv').each do |line|
            vendors[line[0]] = Vendor.new(line[3],line[0],line[1],line[2])
          end
            return vendors
      end

      def self.by_market
        return Market.new
      #
      # def self.find(id)
      #     return Vendor.all[id]
      # end
      end
      def market
        market = Vendor.new.market_id
          return market
      end
  end
end
puts FarMar::Vendor.all
#puts FarMar::Vendor.find()
