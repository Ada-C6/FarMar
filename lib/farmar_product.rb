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
                vendor_id: line[2].to_i
            }

            all_products[line[0].to_i] = self.new(new_product_info_hash)
        end # CSV.open

        return all_products
    end # self.all

    def self.find(product_id)
        return self.all[product_id]
    end # self.find

    # self.by_vendor(vendor_id): returns all of the products with the given vendor_id
    def self.by_vendor(vendor_id)
        raise ArgumentError, "Expected a Fixnum vendor_id" if vendor_id.class != Fixnum

        return self.all.values.select { |product| product.vendor_id == vendor_id }
    end

    #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
    def vendor
        return FarMar::Vendor.find(@vendor_id)
    end #vendor

    #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
    def sales
        return FarMar::Sale.all.values.select { |sale| sale.product_id == @product_id }
    end

    #number_of_sales: returns the number of times this product has been sold.
    def number_of_sales
        return self.sales.length
    end

end # FarMar::Product
