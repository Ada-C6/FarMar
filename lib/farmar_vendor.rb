require 'csv'

module FarMar
  class Vendor
    def initialize(id, name, num_employees, market_id)
      # ID - (Fixnum) uniquely identifies the vendor
      # Name - (String) the name of the vendor (not guaranteed unique)
      # No. of Employees - (Fixnum) How many employees the vendor has at the market
      # Market_id - (Fixnum) a reference to which market the vendor attends
    end 
  end
end

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
