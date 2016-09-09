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
      sale_array = []
      CSV.read("/Users/yasminor/ada/Week_5/FarMar/support/sales.csv").each_with_index do |line, i|
        sale_array[i] = self.new(line[0].to_i, line[1].to_i, DateTime.parse(line[2]), line[3].to_i, line[4].to_i)
      end
      return sale_array
    end

    def self.find(id)
      raise ArgumentError.new("invalid input type") unless id.is_a? (Fixnum)
      all_sales = FarMar::Sale.all
      all_sales.each do |sale|
        if sale.id == id
          return sale
        end
      end
    end

    def vendor # returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
      #use the FarMar::Vendor.find method
      FarMar::Vendor.find(@vendor_id)
    end

    def product # returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
      FarMar::Product.find(@product_id)
    end

    def self.between(beginning_time, end_time) # returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
      sales_within_time_period = []
      all_sales = FarMar::Sale.all
      all_sales.map do |sale|
        if sale.purchase_time > beginning_time && sale.purchase_time < end_time
          sales_within_time_period << sale
        end
      end
      return sales_within_time_period
    end


  end
end
