class FarMar::Sale  # can only chain one to another

  attr_reader :sale_id, :sale_amount, :purchase_date, :vendor_id, :product_id

  def initialize(sale_row)
    @sale_id = sale_row[0]
    @sale_amount = sale_row[1] # in cents
    @purchase_date = sale_row[2]
    # should not have to require vendor_id or product_id
  end

end