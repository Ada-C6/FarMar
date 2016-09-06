# require 'csv'

module FarMar
  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize (hash)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      info = {}
      CVS.read('support/markets.cvs').each do |line|
        id = line[0].to_i
        name = line[1]
        address = line[2]
        city = line[3]
        county = line[4]
        state = line[5]
        zip = line[6]

        info[id] = self.new(name, address, city, county, state, zip)
      end
      return info
    end

    # def self.all
    #   account_info = []
    #   CSV.read('support/accounts.csv').each do |line|
    #     id = line[0].to_i
    #     balance = line[1].to_i
    #     open_date = line[2].to_i
    #     #arrays of arrays
    #     account_info<< self.new(id, balance, open_date)
    #   end
    #   return account_info
    # end
    #
    # def self.find(id)
    #   self.all.each do |line|
    #     #id is at zero index
    #     if line.id == id
    #       return line
    #     end
    #   end
    # end


  end
end
