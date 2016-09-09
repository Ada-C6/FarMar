require 'csv'
module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.load_all
      info = {}
      CSV.read('support/products.csv').each do |line|
        id = line[0].to_i
        name = line[1]
        vendor_id = line[2]

        info[id] = self.new(id, name, vendor_id)
      end
      return info
    end

    def self.all
      @@all_products ||= self.load_all
      return @@all_products
    end

    def self.find(id)
      return self.all[id]
    end

    def vendor
      this_vendor = FarMar::Vendor.find(@vendor_id)
      return this_vendor
    end

    def sales
      all_sales = FarMar::Sale.all

      all_sales.select {|var, sale| sale.product_id == @id}
    end

    def number_of_sales
      all_sales = FarMar::Sale.all
      num_sales = 0

      all_sales.each do |var, sale|
        if sale.product_id == @id
          num_sales += 1
        end
      end
      return num_sales
    end

    def self.by_vendor(this_vendor_id)
      all_products = FarMar::Product.all

      all_products.select {|var, product| product.vendor_id == this_vendor_id}
    end
  end
end
