# September 6th, 2016
# file.rb
# This program reads a file and returns a collection of instances and an instance of object with the matching id

require 'csv'
require_relative '../far_mar'


class FarMar::ReadingFile


#returns a collection of the file
  def self.import_all_file(filename)
    collection = []

    CSV.open(filename, 'r').each do |line|
      collection << line
    end

    return collection
  end

#returns the line with the matching id
  def self.find_instance(filename, id)
    CSV.foreach(filename, 'r') do |line|
      if line[0] == id.to_s
        return line
      end
    end
  end

#returns an array of instances that are associated the an id
  def array_of_instances(an_array_of_instances, instance_variable, id)
    return_array = []

    an_array_of_instances.each do |instance|
      if instance.send(instance_variable) == id
        return_array << instance
      end
    end

    return return_array
  end
end
