module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      list_of_vendors = []
      CSV.read("/Users/YNaka/Ada/project_forks/FarMar/support/vendors.csv", "r").each do |line|
        list_of_vendors << self.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
      end
      list_of_vendors
    end

    def self.find(vendor_id)
      Vendor.all.each do |v|
        if vendor_id == v.id
          return v
        end
      end
      return "That is not an existing vendor ID"
    end
  end
end
