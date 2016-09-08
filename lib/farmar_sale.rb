module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      all_sales = {}
      CSV.read('support/sales.csv').each do | line |
        all_sales[ line[0].to_i ] = self.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
      end
      return all_sales
    end

    def self.find (id)
      sales = self.all
      return sales[id]
    end

    #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale.vendor_id field
    def vendor
      FarMar::Vendor.find(@vendor_id)
    end

    #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Saleproduct_id field
    def product
      FarMar::Product.find(@product_id)
    end

    # self.between(beginning_time, end_time): returns a collection ofFarMar::Sale objects where the purchase time is between the two timesgiven as arguments
    # def self.between (start_time, end_time)
    # all_sales = self.all
    # sales_between = []
    # # s_time = DateTime.strptime(start_time)
    # # e_time = DateTime.strptime(end_time)
    #
    # all_sales.each do | sale_key, sale_values |
    #   if (sale_values.purchase_time >= start_time) && (sale_values.purchase_time < end_time)
    #     sales_between << sale_values
    #   end
    # end
    # return sales_between
    # end
  end
end
