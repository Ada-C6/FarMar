require 'csv'

module FarMar
  class Vendor

    def initialize(id, name, num_empls, market_id)
      @id = id
      @name = name
      @num_empls = num_empls
      @market_id = market_id
    end

    def self.all
      all_vendors = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/vendors.csv").each do |line|
        all_vendors[line[0].to_sym] = self.new(line[0].to_i,line[1],line[2],line[3].to_i)
      end
      return all_vendors
    end

  end

end
