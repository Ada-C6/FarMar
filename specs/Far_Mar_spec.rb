require_relative 'spec_helper'
require_relative '../far_mar'



describe 'Testing FarMar' do

	it 'Must Tell Me if a Vendor Instance Was Made' do
		expect( FarMar::Market.new("Ballard").name ).must_equal("Ballard")
	end

	# it 'Must Raise an ArgumentException if given a non-Fixnum' do
	# 	expect( proc { FizzBuzzX::FizzBuzzX.fizzbuzzx("Something") } ).must_raise ArgumentError
	# end

end