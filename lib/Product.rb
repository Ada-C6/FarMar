require 'CSV'

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name.to_s
      @vendor_id = vendor_id.to_i

    end


    def self.all
      products_hash = {}
      CSV.read("./support/products.csv").each do |line|

        id = line[0].to_i
        name = line[1]
        vendor_id = line[2].to_i
        products_hash[id] = self.new(id, name, vendor_id)
      end
      return products_hash
    end

    def self.find(id)
      return self.all[id]
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor_key, vendor_values|
        if @vendor_id == vendor_values.id
          return vendor_values
        end
      end

    end

  end #end class
end #end module
