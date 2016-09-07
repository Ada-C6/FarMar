# require 'CSV'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id
    def initialize(vendors_hash)
      @id = vendors_hash[:id]
      @name = vendors_hash[:name]
      @num_employees= vendors_hash[:num_employees]
      @market_id = vendors_hash[:market_id]

    end


  end #end class
end #end module

#Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
