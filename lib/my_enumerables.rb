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

  def my_all?
    all = true
    my_each do |element|
      result = yield element
      all &&= result
    end
    all
  end

  def my_any?
    any = false
    my_each do |element|
      result = yield element
      any ||= result
    end
    any
  end

  def my_none?
    none = true
    my_each do |element|
      result = yield element
      none &&= !result
    end
    none
  end

  def my_count
    count = 0
    my_each do |element|
      count += if block_given?
                 (yield element) ? 1 : 0
               else
                 1
               end
    end
    count
  end

  def my_map
    mapped_elements = []
    my_each do |element|
      mapped_elements << (yield element)
    end
    mapped_elements
  end

  def my_inject(base = nil)
    reduction = nil
    first_element = true
    my_each do |element|
      if first_element
        reduction = base.nil? ? element : base
        first_element = false
      end
      reduction = yield reduction, element
    end
    reduction
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
