module FarMar
	class Sale
		def initialize(sale_hash)
			@id = sale_hash[:id]
			@amount = sale_hash[:amount]
			@purchase_time = sale_hash[:purchase_time]
			@vendor_id = sale_hash[:vendor_id]
			@product_id = sale_hash[:product_id]
		end

		def self.all
			sales = []
			CSV.read("/Users/johnamorris/ada/project-forks/FarMar/support/sales.csv").each do |line|
				info_hash = {}
				info_hash[:id] = line[0].to_i
				info_hash[:amount] = line[1].to_i
				info_hash[:purchase_time] = line[2]
				info_hash[:vendor_id] = line[3].to_i
				info_hash[:product_id] = line[4].to_i
				sale = FarMar::Sale.new(info_hash)
				sales << sale
			end
			return sales
		end

	end
end
