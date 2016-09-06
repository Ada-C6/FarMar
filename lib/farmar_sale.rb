# FarMar::Sale

# Each sale belongs to a vendor AND a product. The vendor_id and product_id fields refer to the FarMar::Vendor and FarMar::Product ID fields, respectively. The FarMar::Sale data, in order in the CSV, consists of:

# ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold

# For each of the data classes build the following methods:

# self.all: returns a collection of instances, representing all of the objects described in the CSV
# self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

# Additional FarMar::Sale Methods

# #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
# #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
# self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

class FarMar::Sale
	
end