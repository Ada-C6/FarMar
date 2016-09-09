class FarMar::Sale  # can only chain one to another

  attr_reader :id, :sale_amount, :purchase_date, :id, 

  def initialize(sale_row)
    @id = id
    @sale_amount = sale_amount # in cents
    @purchase_date = purchase_date
    # should not have to require vendor_id or product_id
  end

end