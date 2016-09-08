module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    attr_accessor :list_of_markets

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      list_of_markets = []
      CSV.read("/Users/YNaka/Ada/project_forks/FarMar/support/markets.csv", "r").each do |line|
        list_of_markets << self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
      end
      list_of_markets
    end

    def self.find(this_id)
      Market.all.each do |m|
        if this_id == m.id
          return m
        end
      end
      return "That is not an existing market ID"
    end

  end
end
