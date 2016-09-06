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
  end
end


# def self.find(id)
#   FarMar::Market.all.each do |line|
#     if id == line.id.to_i
#       return line
#     end
#   end
# end
# end
# end
