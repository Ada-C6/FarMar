class FarMar::Sale
  def initialize(id, amount, purch_time, vend, prod)
    @id = id
    @amount = amount
    @purch_time = purch_time
    @vend_id = vend
    @prod_id = prod
  end
end
