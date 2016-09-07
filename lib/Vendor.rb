 require 'CSV'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(vendors_hash)
      @id = vendors_hash[:id]
      @name = vendors_hash[:name]
      @num_employees= vendors_hash[:num_employees]
      @market_id = vendors_hash[:market_id]

    end

    def self.all
      vendors = []
      CSV.read("./support/vendors.csv").each do |line|
        vendors_hash = {}
        vendors_hash[:id] = line[0].to_i
        vendors_hash[:name] = line[1]
        vendors_hash[:num_employees] = line[2]
        vendors_hash[:market_id] = line[3]
        vendors << FarMar::Vendor.new(vendors_hash)
      end
      return vendors
    end

    def self.find(id)
      self.all.each do |vendor|
        if vendor.id == id
          return vendor
        end
      end
    end




  end #end class
end #end module

#Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
