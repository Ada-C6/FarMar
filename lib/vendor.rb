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

    def self.find(id)
        self.all.each do |v_object|
            if v_object.id == id
                return v_object
            end
        end
    end

    def market
        FarMar::Market.all.each do |m_object|
            if m_object.id == @market_id
                return m_object
            end
        end
    end

    def self.by_market(market_id)
        return self.all.select {|v_object| v_object.market_id == market_id}
    end
end
