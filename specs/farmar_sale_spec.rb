require_relative 'spec_helper'

describe FarMar::Sale do

  let(:sale) { FarMar::Sale.new }

  describe "#initialize" do

    it "can create a new instance of Sale" do
      sale.must_be_instance_of(FarMar::Sale)
    end

    it "should know about its related CSV file" do
      sale.sale_csv.wont_be_empty
    end
  end
end
