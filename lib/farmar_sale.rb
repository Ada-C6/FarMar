module FarMar
  class Sale

    attr_reader :id, :amount, :vendor_id, :product_id, :purchase_time

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.parse(purchase_time.to_s)
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      all_sales = []
      CSV.read('support/sales.csv').each do |line|
        all_sales << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
      return all_sales
    end

    def self.find(id)
      self.all.find do |sale|
        sale.id == id
      end
    end

    def vendor
      FarMar::Vendor.find(@vendor_id)
    end

    def product
      FarMar::Product.find(@product_id)
    end

    def self.between(beginning_time, end_time)
      sales_window = self.all.select do |sale|
        sale.purchase_time > beginning_time && sale.purchase_time < end_time
      end
      return sales_window
    end

  end
end
