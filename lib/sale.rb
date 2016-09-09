# require 'csv'
# require_relative 'vendor'
# require_relative 'product'
module FarMar
  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id,
     :vendor_info, :product_info

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
      @vendor_info = []
      @product_info = []

    end
    def self.all
      info = {}
      CSV.read('support/sales.csv').each do |line|
        # CSV.read('../support/sales.csv').each do |line|
        id = line[0].to_i
        amount = line[1].to_i
        purchase_time = line[2]
        vendor_id = line[3].to_i
        product_id = line[4].to_i

        info[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
      end
      return info
    end

    def self.find(id)
      self.all[id]
    end

    def vendor
      vendors = FarMar::Vendor.all
      vendors.each do |key, line|
        if @vendor_id == line.id
          @vendor_info << line
        end
      end
      return @vendor_info
    end

    def product
      products = FarMar::Product.all
      products.each do |key, line|
        if @product_id == line.id
          @product_info << line
        end
      end
      return @product_info
    end
  end
end


# p= FarMar::Sale.new(1, 89, "purchase_time", 5, 4)
# puts p.vendor

# p p.product
