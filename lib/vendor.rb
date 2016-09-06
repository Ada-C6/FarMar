module FarMar
  class Vendor

    def initialize(vendor_hash)
    end

    def self.all
      vendors = [] #array to store all of the hashes with vendor info
      CSV.read("../FarMar/support/vendors.csv").each do |line|
        vendor = {} #create a new hash for each vendor to store specific info

        vendor[:id] = line[0].to_i
        vendor[:name] = line[1]
        vendor[:num_employees] = line[2].to_i
        vendor[:vendor_id] = line[3].to_i

        vendors << self.new(vendor) #creates a new instance with the hash info and puts it in the array to be returned
      end
      vendors #returns this array
    end

  end
end
