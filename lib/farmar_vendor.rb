require 'csv'
require_relative 'farmar_market'
require_relative 'farmar_product'

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
            market_list = FarMar::Market.all
            market_by_market_id = market_list.group_by do |i|
                i.id # this is the instance variable @id in Farmar::Market class
            end
            current_market_id = @market_id
            market_by_market_id[current_market_id]
        end

        #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
        def products
            product_list = FarMar::Product.all
            product_by_vendor_id = product_list.group_by do |i|
                i.vendor_id # this is the instance variable @vendor_id in FarMar::Product class
            end
            current_vendor_id = @id
            product_by_vendor_id[current_vendor_id]
        end

        #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
        def sales
            
        end

        #revenue: returns the the sum of all of the vendor's sales (in cents)
        #self.by_market(market_id): returns all of the vendors with the given market_id
    end
end
