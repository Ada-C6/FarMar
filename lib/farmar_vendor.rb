require 'csv'

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

    end
end
