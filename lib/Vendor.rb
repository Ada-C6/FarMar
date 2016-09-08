 require 'CSV'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id.to_i
      @name = name.to_s
      @num_employees = num_employees.to_i
      @market_id = market_id.to_i


    end

    def self.all
      vendors_hash = {}
      CSV.read("./support/vendors.csv").each do |line|
        id = line[0].to_i
        name = line[1]
        num_employees = line[2].to_i
        market_id = line[3].to_i
       vendors_hash[id] = self.new(id, name, num_employees, market_id)
      end
      return vendors_hash
    end

    def self.find(id)
      return self.all[id]
    end


    def market
    all_markets = FarMar::Market.all

    all_markets.each do |market, value|
      if  @market_id == value.id
         return value
      end
     end
    end


    # def products :return a list of products associated with the vendor
    # end

    def self.by_market(a_market_id)
      all_vendors = self.all #returns hash of all vendors
      #returns a list of vendors associated with the market id
      vendors_list = []
      all_vendors.each do |vendor_key, vendor_value|
        if  vendor_value.market_id == a_market_id
          puts vendor_value.market_id
          puts vendor_value
          vendors_list << vendor_value
        end
      end
      return vendors_list

    end

  end #end class
end #end module

#Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
