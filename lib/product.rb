module FarMar
	class Product
		def initialize(product_hash)
			@id = product_hash[:id]
			@name = product_hash[:name]
			@vendor_id = product_hash[:vendor_id]
		end

		def self.all
			products = []
			CSV.read("/Users/johnamorris/ada/project-forks/FarMar/support/products.csv").each do |line|
				info_hash = {}
				info_hash[:id] = line[0].to_i
				info_hash[:name] = line[1]
				info_hash[:vendor_id] = line[2]
				product = FarMar::Product.new(info_hash)
				products << product
			end
			return products
		end
	end
end
