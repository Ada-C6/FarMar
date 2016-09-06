require_relative 'spec_helper'

module FarMar
  describe Market do

    describe "#initialize" do
      let(:market) { Market.new(:name) }

      it "should create an instance of Market with a name parameter" do
        market.must_be_instance_of(Market)
      end
    end
  end
end
