module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      @id = product_hash[:id]
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id]
    end

    def self.all
      products = [] #array to store all of the hashes with product info
      CSV.read("../FarMar/support/products.csv").each do |line|
        product = {id: line[0].to_i, name: line[1], vendor_id: line[2].to_i} #create a new hash for each product to store specific info

        products << self.new(product) #creates a new instance with the hash info and puts it in the array to be returned
      end
      products #returns this array
    end

    def self.find(id)
      self.all.each do |pro|
        if pro.id == id
          return pro #returns the object whose id matches the argument
        end
      end
    end

  end
end
