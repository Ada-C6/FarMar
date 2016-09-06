module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end


    def self.all
      sls = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/sales.csv','r'). each do |line|
        sls << FarMar::Sale.new(line[0], line[1], line[2], line[3], line[4])
      end
      return sls
    end

    def self.find(id)
      FarMar::Sale.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end

  end
end
