module FarMar
	class Market
		def initialize(market_hash)
			@id = market_hash[:id]
			@name = market_hash[:name]
			@address = market_hash[:address]
			@city = market_hash[:city]
			@county = market_hash[:county]
			@state = market_hash[:state]
			@zip = market_hash[:zip]
		end

		def self.all
			markets = []
			CSV.read("/Users/johnamorris/ada/project-forks/FarMar/support/markets.csv").each do |line|
				info_hash = {}
				info_hash[:id] = line[0].to_i
				info_hash[:name] = line[1]
				info_hash[:address] = line[2]
				info_hash[:city] = line[3]
				info_hash[:county] = line[4]
				info_hash[:state] = line[5]
				info_hash[:zip] = line[6].to_i
				market = FarMar::Market.new(info_hash)
				markets << market
			end
			return markets
		end
	end
end
