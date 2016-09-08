require 'csv'

module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_f
      @purchase_time = purchase_time
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.load_all
      info = {}
      CSV.read('support/sales.csv').each do |line|
        id = line[0].to_i
        amount = line[1]
        purchase_time = line[2]
        vendor_id = line[3]
        product_id = line[4]
        info[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
      end
      return info
    end

    def self.all
      @@all_sales ||= self.load_all
      return @@all_sales
    end

    def self.find(id)
      return self.all[id]
    end

    def vendor
      this_vendor = FarMar::Vendor.find(@vendor_id)
      return this_vendor
    end

    def product
      this_product = FarMar::Product.find(@product_id)
      return this_product
    end

    def self.between(beg_time, end_time)
      all_sales = FarMar::Sale.all
      sales = []

      beg_time = DateTime.strptime(beg_time, "%Y-%m-%d %H:%M:%S")
      end_time = DateTime.strptime(end_time, "%Y-%m-%d %H:%M:%S")

      all_sales.each do |var, sale|
        sale.purchase_time = DateTime.strptime(sale.purchase_time, "%Y-%m-%d %H:%M:%S")
        if sale.purchase_time >= beg_time && sale.purchase_time <= end_time
          sales << sale
        end
      end
      return sales
    end
  end
end
