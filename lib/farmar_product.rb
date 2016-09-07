class FarMar::Product
attr_reader :id
  def initialize (id, name, vend)
    @id = id
    @name = name
    @vend_id = vend
  end
  def self.all
    products = {}
    merch = []
    CSV.open('support/products.csv', 'r').each do |line|
      products[line[0]] = line[1..2]
      id = line[0].to_i
      name = line[1]
      vend = line[2]
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

end
