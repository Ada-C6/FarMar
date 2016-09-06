# require_relative "../lib/Market.rb"
require_relative 'spec_helper'
module FarMar
  describe Market do
    describe "#initialize" do
      let(:market) { Market.new(:name) }

      it "can create an instance of Market" do
        market.must_be_instance_of(Market)
      end
    end
  end
end
