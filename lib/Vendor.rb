class FarMar::Vendor < FarMar::Market # [x]  is this the correct syntax? nope, fixed NOT FarMar::Vendor < Market it's FarMar::Vendor < FarMar::Market

attr_reader :id, :vendor_name, :employee_count, :market_id

  def initialize(id, vendor_name, employee_count)

    @id = id
    @vendor_name = vendor_name
    @employee_count = employee_count
    # should not have to enter market_id here

  end

    def self.all
    # need a constructor loops
    market_array = []
    
    CSV.foreach('./support/vendors.csv') do |line|
      # maybe I do need to build an hash (dict)
      # instance variables would be the key/ import csv data would be the value
      id = line[0]
      vendor_name = line[1]
      employee_count = line[2]

      new_market = FarMar::Market.new(id, vendor_name, employee_count)
    end


  end
end


# testing content moved to far_mar.rb