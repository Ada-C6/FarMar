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
        vendor_array[i] = self.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
      end
      return vendor_array
    end

    def self.find(id)
      raise ArgumentError.new("invalid input type") unless id.is_a? (Fixnum)
      vendor_obj_array = FarMar::Vendor.all
      vendor_obj_array.map do |vendor|
        if vendor.id == id
          return vendor
        end
      end
    end

    def market # returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
      FarMar::Market.find(@market_id)
    end

    def products #returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field
      FarMar::Product.by_vendor(@id)
    end

    def sales # returns a collection of FarMar::Sale instances that are associated by the vendor_id field
      vendor_sales_array = []
      sales_list = FarMar::Sale.all
      sales_list.map do |sale|
        if sale.vendor_id == @id
          vendor_sales_array << sale
        end
      end
      return vendor_sales_array
    end

    def revenue # returns the sum of all of a particular vendor's sales
      vendor_sales_array = []
      sales_list = FarMar::Sale.all
      sales_list.map do |sale|
        if sale.vendor_id == @id
          vendor_sales_array << sale
        end
      end

      amounts_array = []
      vendor_sales_array.map do |vendor_sale|
        amounts_array << vendor_sale.amount
      end

      sum = amounts_array.reduce(:+).to_i
    end

    def self.by_market(market_id) # returns all the vendors with a given market_id
      market_vendors = []
      all_vendors = FarMar::Vendor.all
      all_vendors.map do |vendor|
        if vendor.market_id == market_id
          market_vendors << vendor
        end
      end
      return market_vendors
    end

  end
end
