 require 'CSV'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name.to_s
      @num_employees = num_employees
      @market_id = market_id
      @vendors_markets = []

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
      # self.all.each do |vendor|
      #   if vendor.id == id
      #     return vendor
      #   end
      # end
    end

    # def market #is this method returning information about a particular market, or all the markets one vendor is a part of?
    # #calling the FarMar::VEndor market id, you should be able to return the market
    def markets
    all_markets = FarMar::Market.all

    all_markets.each do |market, value|
      if  @market_id == value.id
         @vendors_markets << value
      end
     end
     return @vendors_markets
    end
    # # this method will return the instance of Market that field the vendor is a part of
    # # returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id
    # end

    # def products :return a list of products associated with the vendor
    # end



  end #end class
end #end module

#Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field. Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:
#
# ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
