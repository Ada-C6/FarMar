# require_relative '../FarMar.rb'

class FarMar::Market

  attr_reader :MARKET_ID, :name, :city, :county, :state, :zip

  def initialize(name)

    # @MARKET_ID = market_id
    @name = name
    # @city = city
    # @county = county
    # @state = state
    # @zip = zip
    
  end 

end

nada_whole_foods = FarMar::Market.new("All the whole fuds, half the check")
