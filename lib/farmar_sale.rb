module FarMar
  class Sale
    attr_reader :id, :amount

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = purchase_time
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
      all_sales = self.all
      all_sales.each do |sale|
        if sale.id == id
          return sale
        end
      end
    end
  end
end
