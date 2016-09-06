require_relative '../FarMar.rb'

class FarMar::Market

  attr_reader :ID, :name, :city, :county, :state, :zip

  def initialiaze

    @ID = ID
    @name = name
    @city = city
    @county = county
    @state = state
    @zip = zip

  end 

end

nada_whole_foods = FarMar::Market.new("Better Than Whole Foods")