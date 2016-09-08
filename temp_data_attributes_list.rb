class Market
     market_id
     market_name
     market_address
     city
     county
     state
     zip
end

class Vendor
    vendor_id
    vendor_name
    employees_num
    market_id
end


class Product
    product_id
    product_name
    vendor_id
end

class Sale
    sale_id
    sale_amount
    purchase_time
    vendor_id
    product_id
end
