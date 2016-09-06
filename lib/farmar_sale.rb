require 'csv'

module FarMar
    class Sale
        attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

        def initialize(id, amount, purchase_time, vendor_id, product_id)
            @id = id # (Fixnum) uniquely identifies the sale
            @amount = amount # (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
            @purchase_time = purchase_time # (Datetime) when the sale was completed
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
    end
end
