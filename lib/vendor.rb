module FarMar
	class Vendor
		def initialize(vendor_hash)
			@id = vendor_hash[:id]
			@name = vendor_hash[:name]
			@employees = vendor_hash[:employees]
			@market_id = vendor_hash[:market_id]
		end
	end
end
