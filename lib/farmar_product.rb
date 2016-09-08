class FarMar::Product
attr_reader :id, :name, :vend_id
  def initialize (id, name, vend_id)
    @id = id
    @name = name
    @vend_id = vend_id
  end
  def self.all
    products = {}
    merch = []
    CSV.open('support/products.csv', 'r').each do |line|
      products[line[0]] = line[1..2]
      id = line[0].to_i
      name = line[1]
      vend = line[2].to_i
      merch << self.new(id, name, vend)
    end
    return merch
  end

  def self.find(id)
    find_id = self.all
    find_id.each do |i|
      if i.id == id
        return i
      end
    end
  end

  def self.by_vendor(vendor_id)
    prod_search = self.all
    prod_search.find_all do |i|
      i.vend_id == vendor_id
    end
  end

end
