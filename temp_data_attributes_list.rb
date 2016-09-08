# Data attributes info for design reference only
# Not for execution

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

# summary:
# 1. practice enumerable method
# 2. classic data modeling, each data is a data model(uml diagram)
# 3. think about optimization, especially in sale file(significantly larger)
# (load file/iterate over data the minimum time, store and indexing the data)
