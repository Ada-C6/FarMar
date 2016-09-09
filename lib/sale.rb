class FarMar::Sale
    attr_reader :id, :amount, :vendor_id, :product_id, :purchase_time

    def initialize(sale_hash)
        @id = sale_hash[:id]
        @amount = sale_hash[:amount]
        @purchase_time = sale_hash[:purchase_time]
        @vendor_id = sale_hash[:vendor_id]
        @product_id = sale_hash[:product_id]
    end

    def self.all
        sales_from_csv = []
        CSV.read('./support/sales.csv').each do |line|
            csv_sale = {
                id: line[0].to_i,
                amount: line[1].to_i,
                purchase_time: line[2], #need to revisit this format with the CSV file and the FarMar specs
                vendor_id: line[3].to_i,
                product_id: line[4].to_i,
            }
            sales_from_csv << self.new(csv_sale)
        end
        sales_from_csv
    end

    def self.find(id)
        self.all.each do |s_object|
            if s_object.id == id
                return s_object
            end
        end
    end

    def vendor
        return FarMar::Vendor.find(@vendor_id)
    end
end
