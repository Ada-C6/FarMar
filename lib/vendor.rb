require 'csv'
module FarMar
  class Vendor
    attr_accessor :id, :name, :num_of_employees, :market_id

    def initialize(id, name, num_of_employees, market_id)
      @id = id.to_i
      @name = name
      @num_of_employees = num_of_employees
      @market_id = market_id.to_i
    end

    def self.load_all
      info = {}
      CSV.read('support/vendors.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        num_of_employees = line[2]
        market_id = line[3]
        info[id] = self.new(id, name, num_of_employees, market_id)
      end
      return info
    end

    def self.all
      @@all_vendors ||= self.load_all
      return @@all_vendors
    end

    def self.find(id)
      return self.all[id]
    end

    def market
      this_market = FarMar::Market.find(@market_id)
      return this_market
    end

    def self.by_market(id)
      all_vendors = self.all
      vendors = []

      all_vendors.each do |vendor, value|
        if value.market_id == id
          vendors << value
        end
      end
      return vendors
    end











  end
end
