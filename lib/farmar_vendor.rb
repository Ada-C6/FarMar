module FarMar
  class Vendor
    attr_reader :id, :name

    def initialize(id, name, employee_count, market_id)
      @id = id.to_i
      @name = name
      @employee_count = employee_count.to_i
      @market_id = market_id.to_i
    end

    def self.all
      all_vendors = []
      CSV.read('support/vendors.csv').each do |line|
        all_vendors << FarMar::Vendor.new(line[0], line[1], line[2], line[3])
      end
      return all_vendors
    end

    def self.find(id)
      all_vendors = self.all
      all_vendors.each do |vendor|
        if vendor.id == id
          return vendor
        end
      end
    end

  end
end
