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
        sale_array[i] = self.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i, line[4].to_i)
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

  end
end
