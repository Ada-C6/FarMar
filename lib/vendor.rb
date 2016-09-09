class FarMar::Vendor
    attr_reader :id, :name, :number_employees, :market_id

    def initialize(vendor_hash)
        @id = vendor_hash[:id]
        @name = vendor_hash[:name]
        @number_employees = vendor_hash[:number_employees]
        @market_id = vendor_hash[:market_id]
    end

    def self.all
        vendors_from_csv = []
        CSV.read('./support/vendors.csv').each do |line|
            csv_vendor = {
                id: line[0].to_i,
                name: line[1],
                number_employees: line[2].to_i,
                market_id: line[3].to_i,
            }
            vendors_from_csv << self.new(csv_vendor)
        end
        vendors_from_csv
    end

    def self.ids
        vendor_ids = []
        self.all.each do |v_object|
            vendor_ids << v_object.id
        end
        return vendor_ids
    end

    def self.find(id)
        if self.ids.include?(id)
            self.all.find {|v_object| v_object.id == id}
        else
            raise ArgumentError.new("Oops, your number input is not a valid vendor id.")
        end
    end

    def market
        return FarMar::Market.find(@market_id)
    end

    def products
        return FarMar::Product::by_vendor(@id)
    end

    def sales
        return FarMar::Sale::all.select {|s_object| s_object.vendor_id == @id}
    end

    def revenue
        sale_amounts_by_vendor = []
        self.sales.each do |s_object|
            sale_amounts_by_vendor << s_object.amount
        end
        sale_amounts_by_vendor.reduce(:+)
    end

    def self.by_market(market_id)
        if FarMar::Market.ids.include?(market_id)
            return self.all.select {|v_object| v_object.market_id == market_id}
        else
            raise ArgumentError.new("Oops, your number input is not a valid market id.")
        end
    end
end
