require_relative 'spec_helper'
# require_relative '../sale'

describe FarMar::Sale do

  # sale_info = {
  #   id: 123,
  #   amount: 88,
  #   purchase_time: "12:50",
  #   vendor_id: 123,
  #   product_id: 123
  # }

  p = FarMar::Sale.new(123, 88, "12:50", 123, 123)

  describe "#initialize" do
    it"should be an instance of Sale" do
    p.must_be_instance_of(FarMar::Sale)
  end
  end
end
