require_relative 'sale'

module FarMar
	class Vendor
		attr_reader :id, :name, :employees, :market_id

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

		def self.find(id)
			raise ArgumentError.new("Invalid ID") if !id.is_a?(Fixnum)
			vendors = self.all
			vendors.each do |vendor|
				if vendor.id == id
					return vendor
				end
			end
		end

		def market
			market = FarMar::Market.find(market_id)
			return market
		end

		def products
			product_list = []
			all_products = FarMar::Product.all
			all_products.each do |product|
				if product.vendor_id == id
					product_list << product
				end
			end
			return product_list
		end

		def sales
			sales_list = []
			all_sales = FarMar::Sale.all
			all_sales.each do |sale|
				if sale.vendor_id == id
					sales_list << sale
				end
			end
			return sales_list
		end

		def revenue
			sales_list = sales
			total = 0
			sales_list.each do |sale|
				total += sale.amount
			end
			return total
		end

	end
end
