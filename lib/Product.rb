class FarMar::Product

  attr_reader :id, :product_name, :vendor_id

  def initialize(id, product_name, vendor_id) 

    @id = id
    @product_name = product_name
    @vendor_id = vendor_id

  end

  def self.all

    product_array = []

    CSV.foreach('./support/products.csv') do |line|

      id = line[0]
      product_name = line[1]
      vendor_id = line[2]

      product_array << FarMar::Product.new(id, product_name, vendor_id)
    
    end
    return product_array
  end

  def self.find(id)

    found_product = nil

    all.each do |product|
      if product.id == id
        found_product = product
        break
      end
    end
    return found_product
  end

  def get_vendor
    found_vendor = FarMar::Vendor.find(@vendor_id)
    return found_vendor
  end

  def get_sales

    found_sales = []
    FarMar::Sale.all.each do |sale|
      if sale.product_id == @id
        found_sales.push(sale)
      end
    end
    return found_sales

  end

end














