module FarMar
	class Sale
		attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

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
				info_hash[:purchase_time] = DateTime.parse(line[2])
				info_hash[:vendor_id] = line[3].to_i
				info_hash[:product_id] = line[4].to_i
				FarMar::Sale.new(info_hash)
				sales << sale
			end
			return sales
		end

		def self.find(id)
			raise ArgumentError.new("Invalid ID") if !id.is_a?(Fixnum)
			sales = self.all
			sales.each do |sale|
				if sale.id == id
					return sale
				end
			end
			return nil
		end

		def vendor
			all_vendors = FarMar::Vendor.all
			all_vendors.each do |vendor|
				if vendor.id == vendor_id
					return vendor
				end
			end
		end

		def product
			all_products = FarMar::Product.all
			all_products.each do |product|
				if product.id == product_id
					return product
				end
			end
		end

		def self.between(beginning_time, end_time)
			beginning_time = DateTime.parse(beginning_time)
			end_time = DateTime.parse(end_time)
			all_sales = FarMar::Sale.all
			sales_between = []

			all_sales.each do |sale|
				if sale.purchase_time >= beginning_time && sale.purchase_time <= end_time
					sales_between << sale
				end
			end

			unless sales_between.length == 0
				return sales_between
			end
			return nil
		end
	end
end
