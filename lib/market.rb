require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :st_addy, :city, :county, :st, :zip

    def initialize(id, name, st_addy, city, county, st, zip)
      @id = id
      @name = name
      @st_addy = st_addy
      @city = city
      @county = county
      @st = st
      @zip = zip
    end

    def self.all
      all_markets = {}
      CSV.read("/Users/nurl/ada/homework/FarMar/support/markets.csv").each do |line|
        all_markets[line[0].to_i] = self.new(line[0].to_i,line[1],line[2],line[3],line[4],line[5],line[6])
      end
      return all_markets
    end

    def self.find(id)
      all_markets = self.all

      if all_markets.has_key?(id)
        return all_markets[id]
      else
        raise ArgumentError.new("We do not have a market with that ID.")
      end
    end

    def self.search(search_term)
      search_results = all.keep_if do |k, v|
        v.name.downcase.include?(" " + search_term.downcase + " ")
      end

      if search_results.length > 1
        return search_results
      else
        raise ArgumentError.new("There are no markets with \"#{search_term}\" in their name")
      end
    end

    def vendors
      all_vendors = FarMar::Vendor.all

      all_vendors.delete_if do |k, v|
        v.market_id != @id
      end
    end

    def products
      prdts_ary = vendors.map do |k, v|
        v.products.map do |ke, va|
          va
        end
      end

      prdts_ary.flatten
    end

    def preferred_vendor
      all_revenues = vendors.map do |k, v|
        v.revenue
      end

      max_value = all_revenues.max

      vendors.keep_if do |k, v|
        return v if v.revenue == max_value
      end
    end

  end

end
