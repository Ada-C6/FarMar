# require 'csv'

module FarMar
  class Vendor

 attr_reader :id, :name, :no_of_employee, :market_id

    def initialize (vendor_info)
      @id = id
      @name = name
      @no_of_employee = no_of_employee
      @market_id = market_id
    end

  end
end
