module FarMar
  class Vendor
    attr_reader :id, :name, :number_of_employees, :market_id
    def initialize(id,name,number_of_employees,market_id)
      @id = id
      @name = name
      @number_of_employees = number_of_employees
      @market_id = market_id
    end
    def self.all
      vendors = {}
      CSV.read('support/vendors.csv').each do |line|
        vendor = self.new(line[0].to_i,line[1],line[2].to_i,line[3].to_i)
        vendors[vendor.id] = vendor
      end
      return vendors
    end
    def self.find(id)
      vendors = self.all
      return vendors[id]
    end
    def market
      return @market_id
    end
    def products
      # @todo START HERE START HERE START HERE
    end


  end


end
