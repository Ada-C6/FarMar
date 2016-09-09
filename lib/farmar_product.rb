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

            product_file = CSV.read('/Users/kelly/Desktop/Ada_C6/FarMar/support/products.csv', 'r')
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

        # vendor: returns the FarMar::Vendor instance that is associated with this product using the FarMar::Product vendor_id field
        def vendor
            return FarMar::Vendor.find(@vendor_id)
        end

        # sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
        def sales
            sales_list = FarMar::Sale.all
            product_sales = sales_list.select { |item| item.product_id == @id }
            return product_sales
        end

        # number_of_sales: returns the number of times this product has been sold.
        def number_of_sales
            num_of_sales = sales.length
            return num_of_sales
        end

        #self.by_vendor(vendor_id): returns all of the products with the given vendor_id
        def self.by_vendor(vendor_id)
            products_by_current_vendor = []
            self.all.select { |item| products_by_current_vendor << item.name if item.vendor_id == vendor_id}
            len = products_by_current_vendor.length
            puts "There are #{len} products sold by the given Vendor ID #{vendor_id}"
            return products_by_current_vendor
        end
    end
end
