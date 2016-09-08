require 'CSV'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id,
    :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = purchase_time
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i

    end

    def self.all
      sales_hash = {}
      CSV.read("./support/sales.csv").each do |line|
        id = line[0].to_i
        amount = line[1]
        purchase_time = line[2]
        vendor_id = line[3]
        product_id = line[4]
        sales_hash[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
      end
      return sales_hash
    end

    def self.find(id)
      return self.all[id]
    end

    def vendor #when you call vendor, it will pull up the vendor instance that matches the vendor id at the top
      all_vendors = FarMar::Vendor.all
      all_vendors.each do |vendor, vendor_values|
        if vendor_values.id == @vendor_id
          return vendor_values
        end
      end
    end

  end
end
