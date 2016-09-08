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

  end #end class
end #end module
