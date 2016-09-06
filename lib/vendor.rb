module FarMar
  class Vendor
    attr_reader :id, :name

    def initialize(vendor_hash)
      @id = vendor_hash[:id]
      @name = vendor_hash[:name]
      @num_employees = vendor_hash[:num_employees]
      @vendor_id = vendor_hash[:vendor_id]
    end

    def self.all
      vendors = [] #array to store all of the hashes with vendor info
      CSV.read("../FarMar/support/vendors.csv").each do |line|
        vendor = {id: line[0].to_i, name: line[1], num_employees: line[2].to_i, vendor_id: line[3].to_i} #create a new hash for each vendor to store specific info

        vendors << self.new(vendor) #creates a new instance with the hash info and puts it in the array to be returned
      end
      vendors #returns this array
    end

    def self.find(id)
      self.all.each do |v|
        if v.id == id
          return v #returns the object whose id matches the argument
        end
      end
    end

  end
end
