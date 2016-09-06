require_relative '../far_mar.rb'

class FarMar::Market

  def initialize(id, name, address, city, county, state, zip )
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

end
