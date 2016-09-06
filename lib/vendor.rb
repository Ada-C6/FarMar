module FarMar
	class Vendor
		def initialize(vendor_hash)
			@id = vendor_hash[:id]
			@name = vendor_hash[:name]
			@employees = vendor_hash[:employees]
			@market_id = vendor_hash[:market_id]
		end

		def self.all
			vendors = []
			CSV.read("/Users/johnamorris/ada/project-forks/FarMar/support/vendors.csv").each do |line|
				info_hash = {}
				info_hash[:id] = line[0].to_i
				info_hash[:name] = line[1]
				info_hash[:employees] = line[2].to_i
				info_hash[:market_id] = line[3].to_i
				vendor = FarMar::Vendor.new(info_hash)
				vendors << vendor
			end
			return vendors
		end
	end
end
