module FarMar
  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id             = id
      @amount         = amount #in cents
      @purchase_time  = purchase_time
      @vendor_id      = vendor_id
      @product_id     = product_id
    end

    def self.all
      sales = {}
      CSV.read('support/sales.csv').each do |line|
        sale = self.new(line[0].to_i,line[1].to_f,DateTime.parse(line[2]),line[3].to_i,line[4].to_i)
        sales[sale.id] = sale
      end
      return sales # Never, ever, ever, ever, ever (!!) forget this one again.
    end

    def self.find(id)
      vendors = self.all
      return vendors[id]
    end

    def vendor
      sale_vendor = Vendor.new(:id, :name, :number_of_employees, :market_id)
      Vendor.all.each do |ven_id, ven|
        if ven_id == vendor_id
          sale_vendor = ven
        end
      end
      return sale_vendor
    end

#Returns the Product instance, associated with this sale using the Sale product_id field
    def product
      sale_product = Product.new(:id, :name, :vendor_id)
      Product.all.each do |pro_id, pro|
        if pro_id == product_id
          sale_product = pro
          break
        end
      end
      return sale_product
    end

    # Returns a collection of Sale objects where the purchase time is between the two times given as arguments
    def self.between(beginning_time, end_time)
      sales_within_times = {}
      self.all.each do |sal_id, sal|
        if beginning_time <= sal.purchase_time
          if end_time >= sal.purchase_time
            sales_within_times[sal_id] = sal
          end
        end
      end
      return sales_within_times
    end



  end #class
end #module
