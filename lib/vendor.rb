# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends

#market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
#products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
#sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
#revenue: returns the the sum of all of the vendor's sales (in cents)
# self.by_market(market_id): returns all of the vendors with the given market_id
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


      def self.find_vendors
          return Vendor.all[id]
      end

  end
end
puts FarMar::Vendor.all
puts FarMar::Vendor.find("444")
