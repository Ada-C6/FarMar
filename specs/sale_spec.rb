require_relative 'spec_helper'
# require_relative '../sale'

describe FarMar::Sale do

  sale_info = {
    id: 123,
    amount: 88,
    purchase_time: "12:50",
    vendor_id: 123,
    product_id: 123
  }

  p = FarMar::Sale.new(sale_info)

  describe "#initialize" do
    it"should be an instance of Sale" do
    p.must_be_instance_of(FarMar::Sale)
  end
  end
end
