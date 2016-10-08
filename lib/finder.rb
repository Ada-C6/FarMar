class Finder # Model: it provides a model to represent the real word(the domin)
  def self.find(id) # have seen behaviors in same pattern(methods) => inheritance(has to be a class)
    found_object = nil
    all.each do |object|
      if object.id == id
        found_object = object
        break
      end
    end
    return found_object
  end
end
