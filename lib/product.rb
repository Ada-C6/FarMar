module FarMar
	class Product
		def initialize(product_hash)
			@id = product_hash[:id]
			@name = product_hash[:name]
			@vendor_id = product_hash[:vendor_id]
		end
	end
end
