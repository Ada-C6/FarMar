require 'csv'

module FarMar
  class Sale

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount / 100  # changes cents to dollars
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      all_sales = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/sales.csv").each do |line|
        all_sales[line[0]] = self.new(line[0].to_i,line[1].to_i,line[2],line[3].to_i,line[4].to_i)
      end
      return all_sales
    end

  end

end
