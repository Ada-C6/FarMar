module FarMar
    class Sale
        attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

        def initialize(id, amount, purchase_time, vendor_id, product_id)
            @id = id # (Fixnum) uniquely identifies the sale
            @amount = amount # (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
            @purchase_time = DateTime.parse(purchase_time) # (Datetime) when the sale was completed
            @vendor_id = vendor_id # (Fixnum) a reference to which vendor completed the sale
            @product_id = product_id # (Fixnum) a reference to which product was sold
        end

        def self.all
            sale_list = []

            sale_file = CSV.read('/Users/kelly/Desktop/Ada_C6/FarMar/support/sales.csv', 'r')
            sale_file.each do |line|
                sale_list << self.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
            end

            return sale_list
        end

        def self.find(id)
            self.all.each do |item|
                if item.id == id
                    return item
                end
            end
            puts "Sorry, invalid Sale ID"
            return nil
        end

        #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
        def vendor
            return FarMar::Vendor.find(@vendor_id)
        end

        #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
        def product
            return FarMar::Product.find(@product_id)
        end

        # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
        def self.between(beginning_time, end_time)
            sales_within_selected_timeframe = FarMar::Sale.all.select { |item| DateTime.parse(beginning_time) < item.purchase_time && item.purchase_time < DateTime.parse(end_time)}
            return sales_within_selected_timeframe
        end
    end
end
