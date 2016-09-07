class FarMar::Sale

    attr_accessor :sale_id, :amount, :purchase_time, :vendor_id, :product_id

    # ID - (Fixnum) uniquely identifies the sale
    # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
    # Purchase_time - (Datetime) when the sale was completed
    # Vendor_id - (Fixnum) a reference to which vendor completed the sale
    # Product_id - (Fixnum) a reference to which product was sold
    def initialize(sale_info_hash)
        @sale_id = sale_info_hash[:sale_id]
        @amount = sale_info_hash[:amount]
        @purchase_time = sale_info_hash[:purchase_time]
        @vendor_id = sale_info_hash[:vendor_id]
        @product_id = sale_info_hash[:product_id]
    end #initialize

    def self.all
        all_sales = {}
        CSV.read('support/sales.csv').each do |line|
            new_sale_info_hash = {
                sale_id: line[0].to_i,
                amount: line[1].to_i,
                purchase_time: DateTime.parse(line[2]),
                vendor_id: line[3].to_i,
                product_id: line[4].to_i
            }

            all_sales[line[0].to_i] = self.new(new_sale_info_hash)
        end # CSV.open

        return all_sales
    end # self.all

    def self.find(sale_id)
        return self.all[sale_id]
    end # self.find

end # FarMar::Sale
