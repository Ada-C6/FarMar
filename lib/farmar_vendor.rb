require 'csv'

class FarMar::Vendor
    attr_reader :id, :name, :num_of_employees, :market_id

    def initialize(id, name, num_of_employees, market_id)
        @id = id
        @name = name
        @num_of_employees = num_of_employees
        @market_id = market_id
    end

end
