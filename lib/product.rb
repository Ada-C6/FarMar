module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      pdcts = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/products.csv','r'). each do |line|
        pdcts << FarMar::Product.new(line[0], line[1], line[2])
      end
      return pdcts
    end

    def self.find(id)
      FarMar::Product.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end

    def vendor
      vndr = nil
      FarMar::Vendor.all.each do |line|
        if @id == line.id
          vndr = line
          break
        end
      end
      return vndr
    end

    def sales
      vnsls = []
      FarMar::Sale.all.each do |line|
        if @id == line.product_id
          vnsls.push(line)
        end
      end
      return vnsls
    end

    def number_of_sales
      vnsls = []
      FarMar::Sale.all.each do |line|
        if @id == line.product_id
          vnsls.push(line)
        end
      end
      return vnsls.length
    end

    def self.by_vendor(vendor_id)
      propven  = []
      FarMar::Product.all.each do |line|
        if vendor_id == line.vendor_id.to_i
          propven.push(line)
        end
      end
      return propven
    end
    #
    # def self.revenue
    #   p_revenue = {}
    #
    #   # Setting eachvalue in the key to 0 so that the revenues can be added to the values.
    #   FarMar::Product.all.each do |line|
    #     p_revenue[line.vendor_id] = 0
    #   end
    #
    #   FarMar::Sale.all.each do |line|
    #
    #
    #   end
    # end


    # def self.most_revenue(n)
    #   FarMar::Sale.all.each do |line|
    #
    #   end
    # end

  end
end

#
# def revenue
#   rvn = 0
#   FarMar::Sale.all.each do |line|
#     if @id == line.vendor_id
#       rvn += line.amount.to_i
#     end
#   end
#   return rvn
# end
