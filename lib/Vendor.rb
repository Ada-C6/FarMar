class FarMar::Vendor < FarMar::Market # [x]  is this the correct syntax? nope, fixed NOT FarMar::Vendor < Market it's FarMar::Vendor < FarMar::Market

attr_reader :vendor_id, :vendor_name, :employee_count, :market_id

  def initialize(vendor_row)

    @vendor_id = vendor_row[0]
    @vendor_name = vendor_row[1]
    @employee_count = vendor_row[2]
    # should not have to enter market_id here

  end
end


# testing content moved to far_mar.rb