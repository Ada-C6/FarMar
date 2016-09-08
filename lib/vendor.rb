module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(vendor_hash)
      @id = vendor_hash[:id]
      @name = vendor_hash[:name]
      @num_employees = vendor_hash[:num_employees]
      @market_id = vendor_hash[:market_id]
    end

    def self.all #returns an array of objects:Vendors
      vendors = [] #array to store all of the hashes with vendor info
      CSV.read("../FarMar/support/vendors.csv").each do |line|
        vendor = {id: line[0].to_i, name: line[1], num_employees: line[2].to_i, market_id: line[3].to_i} #create a new hash for each vendor to store specific info

        vendors << self.new(vendor) #creates a new instance with the hash info and puts it in the array to be returned
      end
      vendors #returns this array
    end

    def self.find(id) #returns the object:Vendor with arg. id
      self.all.each do |v|
        if v.id == id
          return v #returns the object whose id matches the argument
        end
      end
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
      all_sales = self.sales
      total = 0

      all_sales.each do |s|
        total += s.amount
      end
      return total
    end

    def self.by_market(market_id) #returns an array of the vendors with the given market_id
      market_vendors = []
      #use .select
      self.all.each do |v|
        if v.market_id == market_id #finds vendors whose ids match argument
          market_vendors << v #pushes them to array of all vendors at that market
        end
      end
      return market_vendors
    end
  end
end
