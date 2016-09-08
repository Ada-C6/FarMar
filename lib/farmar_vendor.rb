require 'csv'

module FarMar
  class Vendor
    attr_reader :id, :name, :market_id, :num_employees
    def initialize(id, name, num_employees, market_id)
      # ID - (Fixnum) uniquely identifies the vendor
      @id = id
      # Name - (String) the name of the vendor (not guaranteed unique)
      @name = name
      # No. of Employees - (Fixnum) How many employees the vendor has at the market
      @num_employees = num_employees
      # Market_id - (Fixnum) a reference to which market the vendor attends
      @market_id = market_id
    end

    def self.all
      # self.all: returns a collection of instances, representing all of the objects described in the CSV
      vendors = {}

      CSV.read("support/vendors.csv").each do |line|
        id, name, num_employees, market_id = line # parallel assignment!
        id = id.to_i # need id to be a fixnum
        num_employees = num_employees.to_i # want num_employees to be a fixnum also
        market_id = market_id.to_i #want market_id to be a fixnum

        vendors[id] = self.new(id, name, num_employees, market_id)
      end

      return vendors
    end

    def self.find(id)
      # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
      all_vendors = self.all
      all_vendors[id]
    end

    def market
      #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
      # Return the market object that corresponds to the instance's market_id.
      Market.find(@market_id)
    end

    def self.by_market(market_id)
      # self.by_market(market_id): returns all of the vendors with the given market_id
      Vendor.all.values.group_by { |vendor| vendor.market_id }[market_id]
      #I don't like this -- I have an instance variable @market_id for a vendor instance, and the argument market_id that is getting passed in.
    end

    #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
    #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    #revenue: returns the the sum of all of the vendor's sales (in cents)
  end
end
