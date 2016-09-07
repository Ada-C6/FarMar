require 'csv'

module FarMar
  class Vendor

 attr_reader :id, :name, :no_of_employee, :market_id

    def initialize (id, name, no_of_employee, market_id)
      @id = id
      @name = name
      @no_of_employee = no_of_employee
      @market_id = market_id
    end

    def self.all
      info = {}
      CSV.read('../support/vendors.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        no_of_employee = line[2].to_i
        market_id = line[3].to_i

        info[id] = self.new(id, name, no_of_employee, market_id)
      end
      return info
    end

    def self.find(id)
      self.all.each do |key, value|
        if key == id
          return value
        end
      end
    end

  end
end
