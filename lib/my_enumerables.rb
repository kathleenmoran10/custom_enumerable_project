module Enumerable
  def my_each_with_index
    index = 0
    my_each do |element|
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    selected_elements = []
    my_each do |element|
      if yield element
        selected_elements << element
      end
    end
    selected_elements
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end
end
