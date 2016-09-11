module FarMar

  class Sales
    @@all_sales_by_vendor = nil
    @@all_sales_for_each_product = nil
    @@all_sales = nil
    attr_accessor :sales_id, :transaction_total, :datetime, :vendor_id, :product_id
      def initialize(sales_id, transaction_total, datetime, vendor_id, product_id)
        @sales_id = sales_id
        @transaction_total = transaction_total.to_i
        @datetime = DateTime.parse(datetime)
        @vendor_id = vendor_id
        @product_id = product_id
      end

      def vendor
        return Vendor.find(@vendor_id)
      end

      def product
        return Product.find(@product_id)
      end

      ##create instances of sales for each element in csv
      def self.all
        if @@all_sales == nil
          sales = { }
            CSV.read('./support/sales.csv').each do |line|
              sales[line[0]] = Sales.new(line[0],line[1],line[2],line[3],line[4])
            end
            @@all_sales = sales
        end
        return @@all_sales
      end

      def self.find(sales_id)
          return Sales.all[sales_id]
      end

      def self.between(beginning_time, end_time)
        b = DateTime.parse(beginning_time)
        e = DateTime.parse(end_time)
        sales = { }
        Sales.all.each do | sales_id, sale |
        if b < sale.datetime && e > sale.date_time
          sales[line[0]] = Sales.new(line[0],line[1],line[2],line[3],line[4])
        end
        return sales
        end
      end


      def self.by_product(product_id)
        if @@all_sales_for_each_product == nil
          sale = { }
          Sales.all.each do |sales_id, sales|
            if sale[sales.product_id] == nil
              sale[sales.product_id]  = { }
            end
            sale[sales.product_id][sales_id] = vendor_id
          end
          @@all_sales_for_each_product = sale
        end
        return @@all_sales_for_each_product[product_id]
      end

      def self.by_vendor(vendor_id)
        if @@all_sales_by_vendor == nil
          transactions = { }
          Sales.all.each do |sales_id, sales|
            if transactions[sales.vendor_id] == nil
              transactions[sales.vendor_id]  = { }
            end
            transactions[sales.vendor_id][sales_id] = vendor_id
          end
          @@all_sales_by_vendor = transactions
        end
        return @@all_sales_by_vendor[vendor_id]
      end
  end
end
