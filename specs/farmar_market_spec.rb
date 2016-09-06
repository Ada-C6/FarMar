
require_relative 'Spec_helper'
require_relative '../lib/farmar_market'

describe 'Testing FarMar Market' do
  it 'It must raise an IllegalArgument if given a String' do
    expect (proc {FarMar::Market.id("none")} ).must_raise ArgumentError
  end

end
