class FarMar::Sale
  attr_reader :id
  def initialize(id, amount, purch_time, vend, prod)
    @id = id
    @amount = amount
    @purch_time = purch_time
    @vend_id = vend
    @prod_id = prod
  end

  def self.all
    sales = {}
    discount = []
    CSV.open('support/markets.csv', 'r').each do |line|
      sales[line[0]] = line[1..4]
      id = line[0].to_i
      amount = line[1]
      purch_time = line[2]
      vend = line[3]
      prod = line[4]
      discount << self.new(id, amount, purch_time, vend, prod)
    end
    return discount
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
