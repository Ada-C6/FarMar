class FarMar::Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
        @id = product_hash[:id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
    end

    def self.all
        products_from_csv = []
        CSV.read('./support/products.csv').each do |line|
            csv_product = {
                id: line[0].to_i,
                name: line[1],
                vendor_id: line[2].to_i,
            }
            products_from_csv << self.new(csv_product)
        end
        products_from_csv
    end

    def self.ids
        product_ids = []
        self.all.each do |p_object|
            product_ids << p_object.id
        end
        return product_ids
    end

    def self.find(id)
        if self.ids.include?(id)
            self.all.find {|p_object| p_object.id == id}
        else
            raise ArgumentError.new("Oops, your number input is not a valid product id.")
        end
    end

    def vendor
        return FarMar::Vendor.find(@vendor_id)
    end

    def sales
        return FarMar::Sale::all.select {|s_object| s_object.product_id == @id}
    end

    def number_of_sales
        return sales.length
    end

    def self.by_vendor(vendor_id)
        if FarMar::Vendor.ids.include?(vendor_id)
            return self.all.select {|p_object| p_object.vendor_id == vendor_id}
        else
            raise ArgumentError.new("Oops, your number input is not a valid vendor id.")
        end
    end
end
