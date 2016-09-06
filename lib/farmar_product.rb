require 'csv'

module FarMar
    class Product
        attr_reader :id, :name, :vendor_id

        def initialize(id, name, vendor_id)
            @id = id #(Fixnum) uniquely identifies the product
            @name = name #(String) the name of the product (not guaranteed unique)
            @vendor_id = vendor_id #(Fixnum) a reference to which vendor sells this product
        end

        def self.all
            product_list = []

            product_file = CSV.read('../support/products.csv', 'r')
            product_file.each do |line|
                product_list << self.new(line[0].to_i, line[1], line[2].to_i)
            end

            return product_list
        end

        def self.find(id)
            self.all.each do |item|
                if item.id == id
                    return item
                end
            end
            puts "Sorry, invalid Product ID"
            return nil
        end
    end
end
