module FarMar
  class Vendor
    attr_reader :id, :name, :no_of_employees, :market_id

    def initialize(id, name, no_of_employees, market_id)
      @id = id
      @name = name
      @no_of_employees = no_of_employees
      @market_id = market_id

    end

    def self.all
      vendor_array = []
      CSV.read("/Users/yasminor/ada/Week_5/FarMar/support/vendors.csv").each_with_index do |line, i|
        vendor_array[i] = self.new(line[0], line[1], line[2], line[3])
      end
      return vendor_array
    end

    def self.find(id)
      vendor_obj_array = FarMar::Vendor.all
      vendor_obj_array.map do |vendor|
        if vendor.id.to_i == id
          return vendor
        end
      end
    end


  end
end
