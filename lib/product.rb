module FarMar
  class Product

    def initialize(product_hash)
    end

    def self.all
      products = [] #array to store all of the hashes with product info
      CSV.read("../FarMar/support/products.csv").each do |line|
        product = {} #create a new hash for each product to store specific info

        product[:id] = line[0].to_i
        product[:name] = line[1]
        product[:vendor_id] = line[2].to_i

        products << self.new(product) #creates a new instance with the hash info and puts it in the array to be returned
      end
      products #returns this array
    end

  end
end
