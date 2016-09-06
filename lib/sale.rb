module FarMar
	class Sale
		def initialize(sale_hash)
			@id = sale_hash[:id]
			@amount = sale_hash[:amount]
			@purchase_time = sale_hash[:purchase_time]
			@vendor_id = sale_hash[:vendor_id]
			@product_id = sale_hash[:product_id]
		end
	end
end
