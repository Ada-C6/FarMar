require 'csv'
module FarMar
  class Product

    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      info = {}
      CSV.read('../support/products.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        vendor_id = line[2].to_i
        info[id] = self.new(id, name, vendor_id)
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
