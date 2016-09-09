module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(vendor_hash)
      @id = vendor_hash[:id]
      @name = vendor_hash[:name]
      @num_employees = vendor_hash[:num_employees]
      @market_id = vendor_hash[:market_id]
    end

    def self.read #returns an array of objects:Vendors
      vendors = [] #array to store all of the hashes with vendor info
      CSV.read("../FarMar/support/vendors.csv").each do |line|
        vendor = {id: line[0].to_i, name: line[1], num_employees: line[2].to_i, market_id: line[3].to_i} #create a new hash for each vendor to store specific info

        vendors << self.new(vendor) #creates a new instance with the hash info and puts it in the array to be returned
      end
      vendors #returns this array
    end

    def self.all #what happens if the csv file is updated - this variable will not include new data
      @@all_vendors ||= self.read
      return @@all_vendors
    end

    def self.find(id) #returns the object:Vendor with arg. id
      if FarMar::Vendor.ids.include?(id)
        self.all.find { |v| v.id == id }
      else
        raise ArgumentError.new("There are no vendors with that id")
      end

      #OLD CODE WITH .each LOOP
      # self.all.each do |v|
      #   if v.id == id
      #     return v #returns the object whose id matches the argument
      #   end
      # end
    end

    def market #returns the object:Market that this vendor belongs to
      FarMar::Market.find(@market_id)
    end

    def products #returns an array of object:Products that belong to this Vendor
      FarMar::Product.by_vendor(@id)
    end

    def sales #returns a collection of object:Sales that are associated with this vendor
      FarMar::Sale.all.select { |s| s.vendor_id == @id }
    end

    def revenue #returns the sum of all the vendor's sales
      total = 0
      self.sales.each do |s|
        total += s.amount
      end
      return total
    end

    def self.by_market(market_id) #returns an array of the vendors with the given market_id
      # self.all.select { |v| v.market_id == market_id }

      if FarMar::Market.ids.include?(market_id)
        self.all.select { |v| v.market_id == market_id }
      else
        raise ArgumentError.new("There are no vendors associated with this market")
      end
    end

    def self.ids
      vendor_ids = []

      self.all.each do |v|
        vendor_ids << v.id
      end
      return vendor_ids
    end

  end
end
