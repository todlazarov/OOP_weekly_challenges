class Array

  def accumulate
    new_array = []
    each do |n|
      new_array << yield(n) if block_given?
    end
    new_array
  end

end