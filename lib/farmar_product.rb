class FarMar::Product

    attr_accessor :product_id, :name, :vendor_id
    # ID - (Fixnum) uniquely identifies the product
    # Name - (String) the name of the product (not guaranteed unique)
    # Vendor_id - (Fixnum) a reference to which vendor sells this product

    def initialize(product_info_hash)
        @product_id = product_info_hash[:product_id]
        @name = product_info_hash[:name]
        @vendor_id = product_info_hash[:vendor_id]
    end #initialize

    def self.all
        all_products = {}
        CSV.read('support/products.csv').each do |line|
            new_product_info_hash = {
                product_id: line[0].to_i,
                name: line[1],
                vendor_id: line[2]
            }

            all_products[line[0].to_i] = self.new(new_product_info_hash)
        end # CSV.open

        return all_products
    end # self.all

    def self.find(product_id)
        return self.all[product_id]
    end # self.find

end # FarMar::Product
