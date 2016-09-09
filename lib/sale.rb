require 'csv'

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
      CSV.read("/Users/nurl/ada/homework/FarMar/support/sales.csv").each do |line|
        all_sales[line[0].to_i] = self.new(line[0].to_i,line[1].to_i,line[2],line[3].to_i,line[4].to_i)
      end
      return all_sales
    end

    def self.find(id)
      if all.has_key?(id)
        return all[id]
      else
        raise ArgumentError.new("We do not have a sale with that ID.")
      end
    end

    def self.string_to_date(time)
      DateTime.parse(time)
    end

    def self.between(beginning_time, end_time)
      beginning_time = string_to_date(beginning_time)
      end_time = string_to_date(end_time)

      hash = {}
      all.each do |k, v|
        hash[v] = string_to_date(v.purchase_time)
      end

      raise ArgumentError.new("You must give a beginning time that is earlier than an end time") if beginning_time > end_time

      raise ArgumentError.new("These dates are beyond the date range in our database") if (beginning_time < hash.values.min && end_time < hash.values.min ) || (beginning_time > hash.values.max && end_time > hash.values.max)

      hash.delete_if do |k, v|
        v < beginning_time || v > end_time
      end

      return hash.keys
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      return all_vendors[@id]
    end

    def product
      all_products = FarMar::Product.all
      return all_products[@id]
    end
  end
end
