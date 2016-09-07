require 'csv'

class Vendor
  attr_reader :id, :name, :employees, :market_id

  def initialize(id, name, employees, market_id)
    @id = id
    @name = name
    @employees = employees
    @market_id = market_id
  end

  def self.all
    vendors = {}
    CSV.read('../support/vendors.csv').each do |line|
      id = line[0].to_i
      name = line[1]
      employees = line[2].to_i
      market_id = line[3].to_i

      vendors[id] = self.new(id, name, employees, market_id)
    end
    return vendors
  end

  def self.find(id)
    v = Vendor.all
    return v[id]
  end
end
