module FarMar

  class Vendor
    @@all_vendors_by_market = nil
    @@all_vendors = nil
    attr_accessor :market_id, :vendor_id, :name, :employees
      def initialize(market_id, vendor_id, name, employees)
        @market_id = market_id
        @vendor_id = vendor_id
        @name = name
        @employees = employees
      end

      ##returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
      def products
        return Product.by_vendor(@vendor_id)
      end

      #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
      def sales
        return Sales.by_vendor(@vendor_id)
      end

      #revenue: returns the the sum of all of the vendor's sales (in cents)
      ##add for.each method to total all transaction_total(s) in hash
      def revenue
        total = 0
        Sales.by_vendor(@vendor_id).each do | sale_id, sale |
          total += sale.transaction_total
        end
          return total
      end

      def market
        return Market.find(@market_id)
      end

      def self.all
        if @@all_vendors == nil
          vendors = { }
            CSV.read('./support/vendors.csv').each do |line|
              vendors[line[0]] = Vendor.new(line[3],line[0],line[1],line[2])
            end
            @@all_vendors = vendors
        end
        return @@all_vendors
      end

      def self.find(vendor_id)
          Vendor.all[vendor_id]
      end

      def self.by_market(market_id)
        if @@all_vendors_by_market == nil
          vendors = { }
          Vendor.all.each do |vendor_id, vendor|
            if vendors[vendor.market_id] == nil
              vendors[vendor.market_id]  = { }
            end
            vendors[vendor.market_id][vendor.vendor_id] = vendor
          end
          @@all_vendors_by_market = vendors
        end
        return @@all_vendors_by_market[market_id]
      end
  end
end
