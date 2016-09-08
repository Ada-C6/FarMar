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
        sale_hash[:sale_purchase_time] = DateTime.parse(sale[2])
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

    def vendor
      associated_vendor = FarMar::Vendor.find(@vendor_id)
      return associated_vendor.vendor_name
    end

    def product
      associated_product = FarMar::Product.find(@product_id)
      return associated_product.product_name
    end

    def self.between(beginning_time, end_time)
      all_sales = FarMar::Sale.all
      time_range_sales = []
      beginning_time_parse = DateTime.parse(beginning_time)
      end_time_parse = DateTime.parse(end_time)

      all_sales.each do |sale|
        # This condiitonal feels really convoluted; will see if refactoring is possible if time
        if (sale.sale_purchase_time.hour == beginning_time_parse.hour && sale.sale_purchase_time.min ==  beginning_time_parse.min && sale.sale_purchase_time.sec >= beginning_time_parse.sec)
          time_range_sales.push(sale)
        elsif (sale.sale_purchase_time.hour == end_time_parse.hour && sale.sale_purchase_time.min ==  end_time_parse.min && sale.sale_purchase_time.sec <= end_time_parse.sec)
          time_range_sales.push(sale)
        end
      end
      return time_range_sales
    end
  end
end
