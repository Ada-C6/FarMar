module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :country, :state, :zip

    def initialize(id, name , address, city , county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      mrkt = []
      CSV.read('/Users/madeleinejohnson/Ada/project-forks/FarMar/support/markets.csv','r'). each do |line|
        mrkt << FarMar::Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
      end
      return mrkt
    end

    def self.find(id)
      FarMar::Market.all.each do |line|
        if id == line.id.to_i
          return line
        end
      end
    end

    def vendors
      vndrs = []
      FarMar::Vendor.all.each do |line|
        if @id == line.market_id
          vndrs << line
        end
      end
      puts vndrs
      return vndrs
    end

    # def prefered_vendor
    #   # Finding the vendors associated with each of the
    #   vendor_id = []
    #   FarMar::Market.vendors.each do |line|
    #     # creating an array of vendor id's associated with a given vendor
    #     vendor_id.push(line.id)
    #     #IN PROGRESS!!!!
    #
    #   end
    # end
  end
end
