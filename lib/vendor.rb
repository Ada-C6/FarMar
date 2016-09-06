# lib/farmar_market.rb
require 'csv'

class Vendor
attr_reader :id, :name, :num_of_employees, :market_id

  def initialize(vendor)
    @id = vendor[:id]
    @name = vendor[:name]
    @num_of_employees = [:num_of_employees]
    @market_id = [:market_id]
  end

  def self.all
    all_vendors = []

    CSV.read('support/vendors.csv').each do |line|
      vendor = {}
      vendor[:id] = line[0].to_i
      vendor[:name] = line[1]
      vendor[:num_of_employees] = line[2].to_i
      vendor[:market_id] = line[3]


      all_vendors << self.new(vendor)
    end

    return all_vendors
  end

  def self.find(id)
    all.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
    # if id > 500, returns entire array....fix later
  end
end
