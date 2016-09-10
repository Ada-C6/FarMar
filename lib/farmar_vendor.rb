module FarMar
    class Vendor
        attr_reader :id, :name, :num_of_employees, :market_id

        def initialize(id, name, num_of_employees, market_id)
            @id = id # (Fixnum) uniquely identifies the vendor
            @name = name # (String) the name of the vendor (not guaranteed unique)
            @num_of_employees = num_of_employees # (Fixnum) How many employees the vendor has at the market
            @market_id = market_id # (Fixnum) a reference to which market the vendor attends
        end

        def self.all
            vendor_list = []

            vendor_file = CSV.read('/Users/kelly/Desktop/Ada_C6/FarMar/support/vendors.csv', 'r')
            vendor_file.each do |line|
                vendor_list << self.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
            end

            return vendor_list
        end

        def self.find(id)
            self.all.each do |item|
                if item.id == id
                    return item
                end
            end
            puts "Sorry, invalid Vendor ID"
            return nil
        end

        #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
        def market
            return FarMar::Market.find(@market_id)
        end

        #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
        def products
            products_list = FarMar::Product.all
            products_by_vendor_id = products_list.select {|i| i.vendor_id == @id }
            return products_by_vendor_id
        end

        #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
        def sales
            sales_list = FarMar::Sale.all
            sales_by_vendor_id = sales_list.select {|i| i.vendor_id == @id }
            return sales_by_vendor_id
        end

        #revenue: returns the the sum of all of the vendor's sales (in cents)
        def revenue
            sales_of_current_vendor_id = sales
            revenue = 0
            sales_of_current_vendor_id.each do |item|
                revenue += item.amount
            end
            return revenue
        end

        #self.by_market(market_id): returns all of the vendors with the given market_id
        def self.by_market(market_id)
            vendors_in_current_market = []
            self.all.each { |item| vendors_in_current_market << item.name if item.market_id == market_id }
            len = vendors_in_current_market.length
            puts "There are #{len} vendors with the given Market ID #{market_id}"
            return vendors_in_current_market
        end
    end
end
