module FarMar
  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  #self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

  class Sales
    @@all_sales_for_each_product = nil
    @@all_sales = nil
    attr_accessor :sales_id, :transaction_total, :datetime, :vendor_id, :product_id
      def initialize(sales_id, transaction_total, datetime, vendor_id, product_id)
        @sales_id = sales_id
        @transaction_total = transaction_total
        @datetime = datetime
        @vendor_id = vendor_id
        @product_id = product_id
      end

      ##find products by their own id's
      def products
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
          Sale.all[sales_id]
      end

      def self.by_product(product_id)
        if @@all_sales_for_each_product == nil
          sale = { }
          Sales.all.each do |sales_id, sales|
            if sale[sales.product_id] == nil
              sale[sales.product_id]  = { }
            end
            sale[sales.product_id][sales_id] = vendor ##sales_id or sales.sales_id?
          end
          @@all_sales_for_each_product = sale
        end
        return @@all_sales_for_each_product[product_id]
      end
  end
end
