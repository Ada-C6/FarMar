module FarMar
  class Sale

    def initialize(sale_hash)
    end

    def self.all
      sales = [] #array to store all of the hashes with sale info
      CSV.read("../FarMar/support/sales.csv").each do |line|
        sale = {} #create a new hash for each sale to store specific info

        sale[:id] = line[0].to_i
        sale[:name] = line[1]
        sale[:num_employees] = line[2].to_i
        sale[:sale_id] = line[3].to_i

        sales << self.new(sale) #creates a new instance with the hash info and puts it in the array to be returned
      end
      sales #returns this array
    end

  end
end
