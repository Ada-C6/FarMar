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

    def self.find(id)
        self.all.each do |p_object|
            if p_object.id == id
                return p_object
            end
        end
    end

    def vendor
        FarMar::Vendor.all.each do |v_object|
            if v_object.id == @vendor_id
                return v_object
            end
        end
    end

    def sales
        return FarMar::Sale::all.select {|s_object| s_object.product_id == @id}
    end

    def number_of_sales
        return sales.length
    end

    def self.by_vendor(vendor_id)
        return self.all.select {|p_object| p_object.vendor_id == vendor_id}
    end
end
