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
  end
end

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
