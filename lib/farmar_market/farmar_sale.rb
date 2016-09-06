require 'csv'

# lib/farmar_market/farmar_sale.rb
module FarMar
  class Sale

    attr_reader :sale_csv

    def initialize
      @sale_csv = CSV.read("../FarMar/support/sales.csv", "r")
    end

  end
end



sale = FarMar::Sale.new
puts sale.sale_csv
