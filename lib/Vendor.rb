class FarMar::Vendor 

  attr_reader :id, :vendor_name, :employee_count, :market_id

  def initialize(id, vendor_name, employee_count, market_id)

    @id = id
    @vendor_name = vendor_name
    @employee_count = employee_count
    @market_id = market_id
    # should not have to enter market_id here

  end

  def self.all

    vendor_array = []

    CSV.foreach('./support/vendors.csv') do |line|
      id = line[0]
      vendor_name = line[1]
      employee_count = line[2]
      market_id = line[3]

      vendor_array << FarMar::Vendor.new(id, vendor_name, employee_count, market_id)
    end
    return vendor_array
  end

  def self.find(id)

    found_vendor = nil

    all.each do |vendor|
      if vendor.id == id
        found_vendor = vendor
        break
      end
    end
    return found_vendor
  end
end


# testing content moved to far_mar.rb