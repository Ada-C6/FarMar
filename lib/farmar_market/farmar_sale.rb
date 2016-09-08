require 'csv'

# lib/farmar_market/farmar_sale.rb
module FarMar
  class Sale

    attr_reader :sale_id, :sale_amount, :sale_purchase_time, :vendor_id, :product_id

    def initialize(sale_hash)
      @sale_id = sale_hash[:sale_id]
      @sale_amount = sale_hash[:sale_amount]
      @sale_purchase_time = sale_hash[:sale_purchase_time]
      @vendor_id = sale_hash[:vendor_id]
      @product_id = sale_hash[:product_id]

    end

    def self.all
      sale_csv_file = CSV.read("../FarMar/support/sales.csv")
      sale_array = []

      sale_csv_file.each do |sale|
        sale_hash = {}
        sale_hash[:sale_id] = sale[0].to_i
        sale_hash[:sale_amount] = sale[1].to_i
        # Will need to determine how to format time data into non-String; DateTime.parse is promising
        #https://ruby-doc.org/stdlib-2.3.1/libdoc/date/rdoc/DateTime.html
        sale_hash[:sale_purchase_time] = sale[2].to_s
        sale_hash[:vendor_id] = sale[3].to_i
        sale_hash[:product_id] = sale[4].to_i

        sale_array << self.new(sale_hash)
      end
      return sale_array
    end

    def self.find(id)
      sales = self.all
      sales.each do |sale|
        if sale.sale_id == id.to_i
          return sale
        end
      end
      raise Exception("ID was not present")
    end

  end
end
