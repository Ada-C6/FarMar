require_relative "../far_mar.rb"


class FarMar::Vendor

attr_accessor
attr_reader

  def initialize
  end

# returns a collection of markets
  def self.all?
    # ap @@(name of array holding hashes)
  end

# returns an instance of object where value of id field in the CSV matches passed parameter
  def self.find(id)
    # Sample code to use from BankAccount
    #  @@users.each do |user|
    #   if user.owner_ID == id_number
    #     matching_account = user
    #     puts "That matches an ID in our system. Here is your account information."
    #     return ap matching_account
    #   end
    # end
    # puts "That ID does not match any users in our system."
  end

  def market
  end

  def products
  end

  def sales
  end

  def revenue
  end

  def self.by_market(market_id)
  end





end
