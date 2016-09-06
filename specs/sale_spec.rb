require_relative 'spec_helper'

module FarMar
  describe Sale do

    describe "#initialize" do
      let(:sale) {Sale.new(:name) }

      it "should create an instance of Sale with a name parameter" do
        sale.must_be_instance_of(Sale)
      end
    end
  end
end
