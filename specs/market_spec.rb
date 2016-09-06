require_relative 'spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_market'#file name(as same as class name)

describe FarMar::Market do

	it "baseline test returns 'Yeah! baseline test passed'." do
	  expect( FarMar::Market.new.baseline_test ).must_equal('Yeah! baseline test passed.')
	end

end
