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
      list_of_sales = []
      CSV.read("/Users/YNaka/Ada/project_forks/FarMar/support/sales.csv", "r").each do |line|
        list_of_sales << self.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
      end
      list_of_sales
    end

    def self.find(sale_id)
      Sale.all.each do |s|
        if sale_id == s.id
          return s
        end
      end
      return "That does not match any existing sale IDs"
    end

    def vendor
      FarMar::Vendor.all.each do |v|
        if @vendor_id == v.id
          return v
        end
      end
    end

    def product
      FarMar::Product.all.each do |p|
        if @product_id == p.id
          return p
        end
      end
    end
  end
end
