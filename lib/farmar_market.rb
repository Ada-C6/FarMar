# FarMar::Market

# Each individual market has many vendors associated with it. The FarMar::Market data, in order in the CSV, consists of:

# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located

# For each of the data classes build the following methods:

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Market Methods

# vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

class FarMar::Market
	attr_reader :name
	def initialize(name)
		@name = name
		# return name
	end
end