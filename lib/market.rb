# Won't technically be needed except if the file is being run by itself
require 'csv'

module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :country, :state, :zip

    def initialize(id, name , address, city , county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      vndrs = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/markets.csv','r'). each do |line|
        vndrs << FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
      end

      return vndrs
    end

    def self.find(id)
      FarMar::Market.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end
  end
end

FarMar::Market.all
puts
puts FarMar::Market.find(500).name
